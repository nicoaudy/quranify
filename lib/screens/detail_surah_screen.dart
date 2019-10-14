import 'package:flutter/material.dart';
import 'package:hijra/services/ApiService.dart';

class DetailSurahScreen extends StatelessWidget {
  final int index;
  final String latin;

  DetailSurahScreen({@required this.index, @required this.latin});

  @override
  Widget build(BuildContext context) {
    print(index);
    return Scaffold(
      appBar: AppBar(
        title: Text("$latin"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FutureBuilder(
        future: ApiService().loadSurah(index),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          return snapshot.hasData
              ? ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: snapshot.data.text.length,
                  itemBuilder: (BuildContext c, int i) {
                    String key = snapshot.data.text.keys.elementAt(i);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListTile(
                            leading: Text(snapshot.data.text.keys.elementAt(i)),
                            title: Text(
                              '${snapshot.data.text[key]}',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 20.0,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
