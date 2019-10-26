import 'package:flutter/material.dart';
import 'package:hijra/providers/asmaul_husna_provider.dart';
import 'package:provider/provider.dart';

class AsmaulHusnaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final asmaulHusna = Provider.of<AsmaulHusnaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Asmaul Husna",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.5),
        ),
      ),
      body: ListView.builder(
        itemCount: asmaulHusna.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      asmaulHusna.data[index].arabic,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      asmaulHusna.data[index].latin,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      asmaulHusna.data[index].translationId,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
