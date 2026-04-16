class Chocolate {
  final String brand;
  final String name;
  final double cocoaButter; // % (ex: 0.425 for 42.5%)
  final double nonFatCocoaSolids; // %
  final double totalFat; // %
  final double sugar; // %
  final double milkFat; // %
  final double milkSolidsNonFat; // % (Esdl du lait)

  const Chocolate({
    required this.brand,
    required this.name,
    required this.cocoaButter,
    required this.nonFatCocoaSolids,
    required this.totalFat,
    required this.sugar,
    this.milkFat = 0.0,
    this.milkSolidsNonFat = 0.0,
  });

  // Getter for total solids (needed for balancing table later)
  double get totalSolids => cocoaButter + nonFatCocoaSolids + sugar + milkFat + milkSolidsNonFat;
}

final List<Chocolate> chocolatesList = [
  // --- Valrhona ---
  Chocolate(brand: "Valrhona", name: "Araguani 72%", cocoaButter: 0.43, nonFatCocoaSolids: 0.29, totalFat: 0.43, sugar: 0.26),
  Chocolate(brand: "Valrhona", name: "Guanaja 70%", cocoaButter: 0.425, nonFatCocoaSolids: 0.275, totalFat: 0.425, sugar: 0.29),
  Chocolate(brand: "Valrhona", name: "Caraïbe 66%", cocoaButter: 0.405, nonFatCocoaSolids: 0.255, totalFat: 0.405, sugar: 0.32),
  Chocolate(brand: "Valrhona", name: "Alpaco 66%", cocoaButter: 0.39, nonFatCocoaSolids: 0.27, totalFat: 0.39, sugar: 0.31),
  Chocolate(brand: "Valrhona", name: "Nyangbo 68%", cocoaButter: 0.36, nonFatCocoaSolids: 0.32, totalFat: 0.36, sugar: 0.31),
  Chocolate(brand: "Valrhona", name: "Manjari 64%", cocoaButter: 0.39, nonFatCocoaSolids: 0.25, totalFat: 0.39, sugar: 0.35),
  Chocolate(brand: "Valrhona", name: "Extra Bitter 61%", cocoaButter: 0.39, nonFatCocoaSolids: 0.22, totalFat: 0.39, sugar: 0.37),
  Chocolate(brand: "Valrhona", name: "Equatoriale 55%", cocoaButter: 0.37, nonFatCocoaSolids: 0.18, totalFat: 0.37, sugar: 0.43),
  Chocolate(brand: "Valrhona", name: "Extra Noir 53%", cocoaButter: 0.31, nonFatCocoaSolids: 0.22, totalFat: 0.31, sugar: 0.46),
  Chocolate(brand: "Valrhona", name: "Bahibé 46%", cocoaButter: 0.284, nonFatCocoaSolids: 0.176, totalFat: 0.42, sugar: 0.30),

  // --- Cacao Barry ---
  Chocolate(brand: "Cacao Barry", name: "Passy 70%", cocoaButter: 0.41, nonFatCocoaSolids: 0.28, totalFat: 0.41, sugar: 0.30),
  Chocolate(brand: "Cacao Barry", name: "Concorde 66%", cocoaButter: 0.39, nonFatCocoaSolids: 0.26, totalFat: 0.39, sugar: 0.34),
  Chocolate(brand: "Cacao Barry", name: "Chocolat Amer 60%", cocoaButter: 0.33, nonFatCocoaSolids: 0.27, totalFat: 0.33, sugar: 0.40),
  Chocolate(brand: "Cacao Barry", name: "Force Noire 50%", cocoaButter: 0.28, nonFatCocoaSolids: 0.21, totalFat: 0.28, sugar: 0.50),
  Chocolate(brand: "Cacao Barry", name: "Excellence 55%", cocoaButter: 0.34, nonFatCocoaSolids: 0.18, totalFat: 0.34, sugar: 0.45),
  Chocolate(brand: "Cacao Barry", name: "Extra Bitter Guayaquil 64%", cocoaButter: 0.41, nonFatCocoaSolids: 0.23, totalFat: 0.41, sugar: 0.36),
  Chocolate(brand: "Cacao Barry", name: "Ocoa 70%", cocoaButter: 0.40, nonFatCocoaSolids: 0.31, totalFat: 0.40, sugar: 0.30),
  Chocolate(brand: "Cacao Barry", name: "Inaya 65%", cocoaButter: 0.33, nonFatCocoaSolids: 0.33, totalFat: 0.33, sugar: 0.35),
  Chocolate(brand: "Cacao Barry", name: "Ghana 40%", cocoaButter: 0.33, nonFatCocoaSolids: 0.07, totalFat: 0.39, sugar: 0.39, milkFat: 0.06, milkSolidsNonFat: 0.15),
  Chocolate(brand: "Cacao Barry", name: "Zéphyr 34%", cocoaButter: 0.34, nonFatCocoaSolids: 0.0, totalFat: 0.40, sugar: 0.40, milkFat: 0.06, milkSolidsNonFat: 0.20),

  // --- Callebaut ---
  Chocolate(brand: "Callebaut", name: "811 54.5%", cocoaButter: 0.366, nonFatCocoaSolids: 0.194, totalFat: 0.366, sugar: 0.43),
  Chocolate(brand: "Callebaut", name: "W2 28%", cocoaButter: 0.28, nonFatCocoaSolids: 0.0, totalFat: 0.358, sugar: 0.50, milkFat: 0.063, milkSolidsNonFat: 0.167),
];
