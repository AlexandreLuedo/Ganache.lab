import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'screens_exportation_file.dart';
import 'package:provider/provider.dart';
import 'package:ganache_lab/models/notifiers/ganache_title_notifier.dart';
import 'package:ganache_lab/widgets/widgets_exportation_file.dart';

class Correction extends StatefulWidget {
  const Correction({super.key});

  @override
  State<Correction> createState() => _CorrectionState();
}

class _CorrectionState extends State<Correction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<TitleModel>(
          builder:
              (_, model, _) =>
                  Text(model.title.isEmpty ? "Votre Ganache" : model.title),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEB8C36),
        foregroundColor: Colors.white,
        onPressed: () {
          // WARNING when you need to add the storage of TitleModel in a recipe!
          context.read<TitleModel>().reset();
          Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: Icon(Symbols.save, fill: 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          children: [
            IconButton(
              tooltip: "Partager la ganache",
              icon: const Icon(Symbols.share, fill: 1),
              onPressed: () {},
            ),
            IconButton(
              tooltip: "Modifier la ganache",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateGanache()),
                );
              },
              icon: const Icon(Symbols.edit, fill: 1),
            ),
          ],
        ),
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Phase de correction",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              CustomContainer(
                width: double.infinity,
                margin: 10.0,
                padding: 20.0,
                borderRadius: 12,
                borderWidth: 1,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Symbols.percent,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Pourcentages faussés",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          "labore quis Lorem sint eu eu commodo et laboris reprehenderit esse commodo est amet ea aliqua ut incididunt dolore consectetur consectetur eiusmod proident est est eiusmod in sunt Lorem dolore enim elit aliqua sit incididunt id mollit dolore laboris quis est cupidatat sint duis ea deserunt cillum nulla enim veniam",
                        ),
                        SizedBox(height: 10),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: Icon(Symbols.check),
                          label: const Text("Résoudre"),
                          iconAlignment: IconAlignment.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomContainer(
                width: double.infinity,
                margin: 10.0,
                padding: 20.0,
                borderRadius: 12,
                borderWidth: 1,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Symbols.percent,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Pourcentages faussés",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          "labore quis Lorem sint eu eu commodo et laboris reprehenderit esse commodo est amet ea aliqua ut incididunt dolore consectetur consectetur eiusmod proident est est eiusmod in sunt Lorem dolore enim elit aliqua sit incididunt id mollit dolore laboris quis est cupidatat sint duis ea deserunt cillum nulla enim veniam",
                        ),
                        SizedBox(height: 10),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: Icon(Symbols.check),
                          label: const Text("Résoudre"),
                          iconAlignment: IconAlignment.end,
                        ),
                      ],
                    ),
                    // Positioned(
                    //   bottom: 1,
                    //   right: 10,
                    //   child: FilledButton.icon(
                    //     onPressed: () {},
                    //     icon: Icon(Symbols.check),
                    //     label: const Text("Résoudre"),
                    //     iconAlignment: IconAlignment.end,
                    //   ),
                    // ),
                  ],
                ),
              ),
              CustomContainer(
                width: double.infinity,
                margin: 10.0,
                padding: 20.0,
                borderRadius: 12,
                borderWidth: 1,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Symbols.percent,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Pourcentages faussés",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Text(
                          "labore quis Lorem sint eu eu commodo et laboris reprehenderit esse commodo est amet ea aliqua ut incididunt dolore consectetur consectetur eiusmod proident est est eiusmod in sunt Lorem dolore enim elit aliqua sit incididunt id mollit dolore laboris quis est cupidatat sint duis ea deserunt cillum nulla enim veniam",
                        ),
                        SizedBox(height: 10),
                        FilledButton.icon(
                          onPressed: () {},
                          icon: Icon(Symbols.check),
                          label: const Text("Résoudre"),
                          iconAlignment: IconAlignment.end,
                        ),
                      ],
                    ),
                    // Positioned(
                    //   bottom: 1,
                    //   right: 10,
                    //   child: FilledButton.icon(
                    //     onPressed: () {},
                    //     icon: Icon(Symbols.check),
                    //     label: const Text("Résoudre"),
                    //     iconAlignment: IconAlignment.end,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
