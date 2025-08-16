import 'package:flutter/material.dart';
import 'screens_exportation_file.dart';

class Correction extends StatefulWidget {
  const Correction({super.key});

  @override
  State<Correction> createState() => _CorrectionState();
}

class _CorrectionState extends State<Correction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ganache chocolat Callebaut")),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEB8C36),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.popUntil(
            context,
              (route) => route.isFirst,
          );
        },
        child: Icon(Icons.save),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Row(
          children: [
            IconButton(
              tooltip: "Partager la ganache",
              icon: const Icon(Icons.share),
              onPressed: () {},
            ),
            IconButton(
              tooltip: "Modifier la ganache",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateGanache()),
                  // TODO va pas fonctionner (je pense)
                );
              },
              icon: const Icon(Icons.edit),
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
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.percent),
                            const SizedBox(width: 5),
                            Text(
                              "Pourcentages faussés",
                              style: Theme.of(context).textTheme.titleLarge,
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
                          icon: Icon(Icons.check),
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
                    //     icon: Icon(Icons.check),
                    //     label: const Text("Résoudre"),
                    //     iconAlignment: IconAlignment.end,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.percent),
                            const SizedBox(width: 5),
                            Text(
                              "Pourcentages faussés",
                              style: Theme.of(context).textTheme.titleLarge,
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
                          icon: Icon(Icons.check),
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
                    //     icon: Icon(Icons.check),
                    //     label: const Text("Résoudre"),
                    //     iconAlignment: IconAlignment.end,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.percent),
                            const SizedBox(width: 5),
                            Text(
                              "Pourcentages faussés",
                              style: Theme.of(context).textTheme.titleLarge,
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
                          icon: Icon(Icons.check),
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
                    //     icon: Icon(Icons.check),
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
