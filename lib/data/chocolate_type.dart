import 'package:ganache_lab/models/chocolate/chocolate_item_type.dart';

final ChocolateTypes = [
  // Framed
  ChocolateTypeItem(
    type: "Dark",
    isFramed: true,
    isMolded: false,
    cocoaButter: 0.18,
  ),

  ChocolateTypeItem(
    type: "Milk",
    isFramed: true,
    isMolded: false,
    cocoaButter: 0.22,
  ),

  ChocolateTypeItem(
    type: "White",
    isFramed: true,
    isMolded: false,
    cocoaButter: 0.23,
  ),

  ChocolateTypeItem(
    type: "Milk & Black",
    isFramed: true,
    isMolded: false,
    cocoaButter: 0.20,
  ),
]; // It can't calculate the basic cocoabutter percent based on any chocolate automaticly. I think it is not important at all.
/// DOC
/// The better way to create an basic cocoabutter value for the starting point of ganache calculation is to start with an
