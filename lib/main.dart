import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ganache_lab/models/notifiers/chocolate_type_notifier.dart';
import 'package:ganache_lab/screens/screens_exportation_file.dart';
import 'package:ganache_lab/services/calculation.dart';
import 'package:ganache_lab/widgets/ganache_type_selection.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/notifiers/ganache_title_notifier.dart';
import 'package:ganache_lab/models/notifiers/weight_ganache_notifier.dart';
import 'package:ganache_lab/models/notifiers/temperature_notifier.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/licenses/LICENSE.md');
    yield LicenseEntryWithLineBreaks(['Ganache.lab'], license);
  });

  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TitleModel()),
      ChangeNotifierProvider(create: (_) => ApplicationModel()),
      ChangeNotifierProvider(create: (_) => MoldModel()),
      ChangeNotifierProvider(create: (_) => FrameModel()),
      ChangeNotifierProvider(create: (_) => OtherModel()),
      ChangeNotifierProvider(create: (_) => TotalModel()),
      ChangeNotifierProvider(create: (_) => ChocolateTypeModel()),
      ChangeNotifierProvider(create: (_) => RecipeNotifier()),
      ChangeNotifierProvider(create: (_) => TemperatureModel()),
    ],
    child: const GanacheApp(),
  ));
}

class GanacheApp extends StatelessWidget {
  const GanacheApp({super.key});

  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(
          0xFFEB8C36,
        ), // Brun: 0xFF422322 Orange: 0xFFEB8C36
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: const Navigation(),
    );
  }
}
