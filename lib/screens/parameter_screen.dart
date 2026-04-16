import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../models/list_item.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';
import '../data/custom_container_items.dart';

class ParameterScreen extends StatelessWidget {
  const ParameterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres (CustomContainer test)')),
      body: ListView.builder(
        itemCount: customContainerItems.length,
        itemBuilder: (context, index) {
          final CustomContainerItem item = customContainerItems[index];
          return CustomContainer(
            color: item.color,
            borderRadius: 12,
            borderWidth: 1,
            child: ListTile(
              leading: item.icon != null ? Icon(item.icon) : null,
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              onTap: item.onTap,
              trailing: const Icon(Symbols.chevron_right),
            ),
          );
        },
      ),
    );
  }
}
