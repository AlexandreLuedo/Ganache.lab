import 'package:flutter/material.dart';
import '../../data/parameters.dart';

class MeasurementUnitsScreen extends StatelessWidget {
  const MeasurementUnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unités de mesures')),
      body: ListView.builder(
        itemCount: measurementsUnitsItems.length,
        itemBuilder: (context, index) {
          final item = measurementsUnitsItems[index];
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
