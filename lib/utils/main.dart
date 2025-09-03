import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/screens_exportation_file.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/change_notifier.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => TitleModel(),
    child: const GanacheApp(),
  ),
);

class GanacheApp extends StatelessWidget {
  const GanacheApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFEB8C36),
        useMaterial3: true,
      ),
      home: const Navigation(),
    );
  }
}
