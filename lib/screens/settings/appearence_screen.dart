import 'package:flutter/material.dart';
import '../../data/parameters.dart';
import '../../models/list_item.dart';

class AppearenceScreen extends StatelessWidget {
  const AppearenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apparence'),
      ),
      body: ListView.builder(
        itemCount: apparenceItems.length,
        itemBuilder: (context, index) {
          final item = apparenceItems[index];
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
