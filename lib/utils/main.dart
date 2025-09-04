import 'package:flutter/material.dart';
import 'package:ganache_lab/screens/screens_exportation_file.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/change_notifier.dart';

void main() => runApp(
  MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Total()),
    ChangeNotifierProvider(create: (_) => TitleModel()),
    ChangeNotifierProvider(create: (_) => MouleModel()),
    ChangeNotifierProvider(create: (_) => CadreModel()),
    ChangeNotifierProvider(create: (_) => AutreModel()),
  ],
    child: const GanacheApp(),
  )

);

class GanacheApp extends StatelessWidget {
  const GanacheApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFEB8C36), // Brun: 0xFF422322 Orange: 0xFFEB8C36
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      home: const Navigation(),
    );
  }
}
