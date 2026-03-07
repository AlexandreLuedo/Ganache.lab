import 'package:flutter/material.dart';
import '../../data/parameters.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('À propos')),
      body: ListView.builder(
        itemCount: aboutItems.length,
        itemBuilder: (context, index) {
          final item = aboutItems[index];
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
