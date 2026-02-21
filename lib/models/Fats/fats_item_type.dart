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
        100; // Mauvaise utilisation des pourcentagescd
  }

  /// DOC
  /// Exemples de ce que je peux faire pour calculer la matière grasse.
  /// WARN
  /// Les utilisations des pourcentages sont à revoir
  String get fatDiagnostic {
    double fat = totalOthersFats; // Ici il faudrait le % par rapport au total
    // Imaginons que nous avons le pourcentage :
    double percent = 14.0; // À remplacer par ton calcul réel

    if (percent < 10) return "Trop maigre : manque de fondant";
    if (percent > 18) {
      return "Trop gras : risque de déphasage ou texture pâteuse";
    }
    if (percent >= 13 && percent <= 15) return "Idéal : Équilibre parfait";
    return "Correct";
  }
}
