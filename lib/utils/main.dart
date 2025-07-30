import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/screens_exportation_file.dart';

void main() => runApp(const GanacheApp());

class GanacheApp extends StatelessWidget {
  const GanacheApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xFFEB8C36)),
      home: const Navigation(),
    );
  }
}