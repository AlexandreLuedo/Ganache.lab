import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ganache_lab/data/parameters.dart';

class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  String _licenseText = '';

  @override
  void initState() {
    super.initState();
    _loadLicense();
  }

  Future<void> _loadLicense() async {
    final text = await rootBundle.loadString('assets/licenses/LICENSE.md');
    setState(() {
      _licenseText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Licence - Ganache.lab')),
      body: Markdown(data: _licenseText, padding: EdgeInsets.all(16)),
    );
  }
}
