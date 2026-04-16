import 'package:ganache_lab/models/sugar/sugar_item_type.dart';

/// Reference list for various sugars used in the chocolate industry.
/// Molar weights (MW) are essential for calculating the Water Activity (Aw) using the Ross formula.
final SugarTypes = [
  SugarTypeItem(
    title: "Saccharose",
    totalSolids: 1.0,
    pointOfOverrun: 1.0,
    molarWeight: 342.3, // g/mol
  ),
  SugarTypeItem(
    title: "Glucose atomisé",
    totalSolids: 0.95,
    pointOfOverrun: 0.47,
    molarWeight: 450.0, // Multi-saccharide mix
  ),
  SugarTypeItem(
    title: "Glucose DE 60",
    totalSolids: 0.80,
    pointOfOverrun: 0.70,
    molarWeight: 300.0, // High DE mix
  ),
  SugarTypeItem(
    title: "Sucre inverti",
    totalSolids: 0.78,
    pointOfOverrun: 1.27,
    molarWeight: 180.2, // Fructose + Glucose
  ),
  SugarTypeItem(
    title: "Dextrose",
    totalSolids: 0.92,
    pointOfOverrun: 0.75,
    molarWeight: 180.2, // Pure glucose monomer
  ),
  SugarTypeItem(
    title: "Sorbitol cristal",
    totalSolids: 1.0,
    pointOfOverrun: 0.55,
    molarWeight: 182.2, // Polyol (very powerful for Aw)
  ),
];
