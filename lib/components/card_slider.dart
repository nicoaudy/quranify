import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  CardSlider({
    @required this.title,
    @required this.slider,
    @required this.trailing,
  });

  final String title;
  final Widget slider;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Card(
        color: Theme.of(context).primaryColor,
        elevation: 0,
        child: ListTile(
          contentPadding: EdgeInsets.only(top: 10, right: 30, left: 15),
          title: Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          ),
          subtitle: slider,
          trailing: Text(
            trailing,
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          ),
        ),
      ),
    );
  }
}
