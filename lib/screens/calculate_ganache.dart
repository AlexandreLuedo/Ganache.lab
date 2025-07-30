import 'package:flutter/material.dart';
import 'create_ganache.dart';


class CalculateGanache extends StatelessWidget {
  const CalculateGanache({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculer sa ganache"),
      ),
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          child: Row(
            children: [
              IconButton(
                tooltip: "Partager la ganache",
                icon: const Icon(Icons.share),
                onPressed: () {

                },
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
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "Corriger",
          tooltip: "Corriger la ganache",
          label: Text("Corriger"),
          icon: Icon(Icons.check),
          backgroundColor: Color(0xFFEB8C36),
          foregroundColor: Colors.white,
          onPressed: () {
            // TODO à implémenter
          },
        ),
         floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

        body: Center(
       child: Container()
        )
    );
  }
}
