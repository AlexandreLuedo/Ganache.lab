class FatsItemType {
  final double butter;
  final double cream;
  final double fat;
  final double oil;
  final double rule = 0.14;

  FatsItemType(this.butter, this.cream, this.fat, this.oil);

  double get totalOthersFats => (butter + cream + fat + oil);

  double calculateFatPercentage(double total) {
    if (total == 0) return 0;
    return (totalOthersFats / total) *
        100; // Bad use of percentagescd
  }

  /// DOC
  /// Examples of what I can do to calculate fat.
  /// WARN
  /// The use of percentages needs to be reviewed
  String get fatDiagnostic {
    double fat = totalOthersFats; // Here it should be the % compared to the total
    // Let's imagine we have the percentage:
    double percent = 14.0; // To be replaced by your actual calculation

    if (percent < 10) return "Trop maigre : manque de fondant";
    if (percent > 18) {
      return "Trop gras : risque de déphasage ou texture pâteuse";
    }
    if (percent >= 13 && percent <= 15) return "Idéal : Équilibre parfait";
    return "Correct";
  }
}