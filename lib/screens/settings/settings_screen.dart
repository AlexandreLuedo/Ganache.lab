import 'package:flutter/material.dart';
import '../../data/parameters.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: ListView.builder(
        itemCount: settingsItems.length,
        itemBuilder: (context, index) {
          final item = settingsItems[index];
          return ListTile(
            leading: item.leading,
            title: Text(item.title),
            subtitle: item.subtitle.isNotEmpty ? Text(item.subtitle) : null,
            onTap: item.isClickable ? () => item.onTap?.call(context) : null,
          );
        },
      ),
    );
  }
}
