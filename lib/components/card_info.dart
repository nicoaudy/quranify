import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String title;
  final String trans;
  final String arab;
  final Function onTap;

  CardInfo(
      {@required this.title,
      @required this.trans,
      @required this.arab,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
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
              child: Icon(Icons.receipt,
                  color: Theme.of(context).primaryColorLight),
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
                      color: Theme.of(context).primaryColorLight,
                      fontSize: 11.0),
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
              onTap: onTap,
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
