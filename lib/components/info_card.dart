import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String trans;
  final String arab;

  InfoCard({@required this.title, @required this.trans, @required this.arab});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24),
              ),
            ),
            child:
                Icon(Icons.receipt, color: Theme.of(context).primaryColorLight),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Text(
                trans,
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight, fontSize: 11.0),
              ),
              Text(
                " - ",
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              Text(
                arab,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 20.0,
                ),
              )
            ],
          ),
          trailing: GestureDetector(
            onTap: () => print("tap"),
            child: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
