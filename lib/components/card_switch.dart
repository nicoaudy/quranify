import 'package:flutter/material.dart';

class CardSwitch extends StatelessWidget {
  CardSwitch({
    @required this.title,
    @required this.leading,
  });

  final String title;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 0,
        child: ListTile(
            title: Text(
              title,
              style: TextStyle(color: Theme.of(context).primaryColorLight),
            ),
            trailing: leading),
      ),
    );
  }
}
