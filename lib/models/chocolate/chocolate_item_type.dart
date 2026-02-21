class ChocolateTypeItem {
  final String type;
  final bool isFramed;
  final bool isMolded;
  final double cocoaButter;
  final double moldedMin;
  final double moldedMax;

  ChocolateTypeItem({
    required this.type,
    required this.isFramed,
    required this.isMolded,
    required this.cocoaButter,
    this.moldedMin = 0.12,
    this.moldedMax = 0.18,
  });

  String get title => "$type Chocolate";

  double get moldedMedian => (moldedMin + moldedMax) / 2;

  /// DOC
  /// In fact, this median is a good default value,
  /// but I need to implement a system to modify this value between 12.0 and 18.0%
}
