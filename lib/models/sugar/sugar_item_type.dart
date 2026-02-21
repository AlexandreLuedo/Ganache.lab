class SugarTypeItem {
  final String title;
  final double saccharoseRule = 0.15;
  final double glucoseRuleMin = 0.05;
  final double glucoseRuleMax = 0.1;
  final double sorbitolRuleMax = 0.05;
  final double totalSolids; // EST (Extrait sec total)
  final double pointOfOverrun; // PS (Pouvoir Sucrant)

  SugarTypeItem({
    required this.title,
    required this.totalSolids,
    required this.pointOfOverrun,
  });
}
