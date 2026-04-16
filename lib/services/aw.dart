/// This class translates the calculated Water Activity (Aw) into shelf life (days).
/// It uses a reference map and linear interpolation for precision.
class AwService {
  // Reference scale: {Aw: Days}
  // This map must be sorted by Aw in descending order.
  static final Map<double, int> _awScale = {
    0.91: 10,
    0.85: 25,
    0.80: 55,
    0.75: 100,
    0.72: 200,
    0.71: 260,
  };

  /// Calculates the number of days for shelf life based on Aw value.
  /// Uses linear interpolation between two reference points.
  static int getDaysFromAw(double aw) {
    // Edge cases: out of range
    if (aw >= 0.91) return 10;
    if (aw <= 0.71) return 260;

    // Get sorted keys to iterate through segments
    List<double> keys = _awScale.keys.toList();
    
    for (int i = 0; i < keys.length - 1; i++) {
      double highAw = keys[i];
      double lowAw = keys[i + 1];

      // Check if the current Aw falls within this segment
      if (aw <= highAw && aw >= lowAw) {
        int daysAtHighAw = _awScale[highAw]!;
        int daysAtLowAw = _awScale[lowAw]!;

        // Linear interpolation formula:
        // ratio represents how far the current Aw is between high and low points.
        double ratio = (highAw - aw) / (highAw - lowAw);
        
        // Final result: base days + the progress towards the next point.
        return (daysAtHighAw + (ratio * (daysAtLowAw - daysAtHighAw))).round();
      }
    }
    return 10; // Default safety fallback
  }

  /// Generates a formatted date string for the DLC (e.g., "15/04/2026").
  static String getFormattedDate(int days) {
    DateTime now = DateTime.now();
    DateTime dlc = now.add(Duration(days: days));
    
    // Manual formatting for the MVP without external libraries
    String day = dlc.day.toString().padLeft(2, '0');
    String month = dlc.month.toString().padLeft(2, '0');
    String year = dlc.year.toString();

    return "$day/$month/$year";
  }
}
