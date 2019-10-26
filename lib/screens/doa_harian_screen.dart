import 'package:flutter/material.dart';
import 'package:hijra/providers/doa_harian_provider.dart';
import 'package:provider/provider.dart';

class DoaHarianScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final doaHarian = Provider.of<DoaHarianProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Doa Harian",
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.5),
        ),
      ),
      body: ListView.builder(
        itemCount: doaHarian.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doaHarian.data[index].title,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doaHarian.data[index].arabic,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doaHarian.data[index].latin,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      doaHarian.data[index].translation,
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
