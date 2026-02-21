import 'package:flutter/material.dart';
import '../../data/parameters.dart';

class AppearenceScreen extends StatefulWidget {
  const AppearenceScreen({super.key});

  @override
  State<AppearenceScreen> createState() => _AppearenceScreenState();
}

class _AppearenceScreenState extends State<AppearenceScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apparence')),
      body: ListView.builder(
        itemCount: apparenceItems.length,
        itemBuilder: (context, index) {
          final item = apparenceItems[index];
          return ListTile(
            leading: item.leading,
            title: Text(item.title),
            subtitle: item.subtitle.isNotEmpty ? Text(item.subtitle) : null,
            trailing: item.trailing,
            onTap: item.isClickable ? () => item.onTap?.call(context) : null,
          );
        },
      ),
    );
  }
}
