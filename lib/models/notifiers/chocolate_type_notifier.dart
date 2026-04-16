import 'package:flutter/material.dart';
import 'package:ganache_lab/data/chocolates_data.dart';

// Get the chocolate type value by the user selection
class ChocolateTypeModel extends ChangeNotifier {
  Chocolate? _selectedChocolate;
  String? _selection; // Keeping this for UI compatibility if needed

  Chocolate? get selectedChocolate => _selectedChocolate;
  String? get selection => _selection;

  // This provides the target BC based on the type (Dark, Milk, etc.)
  // as per the methodology (e.g., 18% for Dark in Frame)
  double get cocoaButterTarget {
    switch (_selection) {
      case "Noir":
        return 0.18;
      case "Lait":
        return 0.22;
      case "Noir/Lait":
        return 0.20;
      case "Blanc":
        return 0.23;
      case "Autre":
      default:
        return 0.20;
    }
  }

  void reset() {
    _selection = null;
    _selectedChocolate = null;
    notifyListeners();
  }

  void updateSelection(String? newValue) {
    _selection = newValue;
    
    // Automatically select a reference chocolate based on the type
    switch (newValue) {
      case "Noir":
        _selectedChocolate = const Chocolate(
          brand: "Valrhona",
          name: "Guanaja 70%",
          cocoaButter: 0.425,
          nonFatCocoaSolids: 0.275,
          totalFat: 0.425,
          sugar: 0.29,
        );
        break;
      case "Lait":
        _selectedChocolate = const Chocolate(
          brand: "Valrhona",
          name: "Jivara 40%",
          cocoaButter: 0.40,
          nonFatCocoaSolids: 0.07, // Standard for milk
          totalFat: 0.40,
          sugar: 0.33,
          milkFat: 0.06,
          milkSolidsNonFat: 0.17,
        );
        break;
      case "Blanc":
        _selectedChocolate = const Chocolate(
          brand: "Cacao Barry",
          name: "Zéphyr 34%",
          cocoaButter: 0.34,
          nonFatCocoaSolids: 0.0,
          totalFat: 0.40,
          sugar: 0.40,
          milkFat: 0.06,
          milkSolidsNonFat: 0.20,
        );
        break;
      default:
        _selectedChocolate = null;
    }
    notifyListeners();
  }
}
