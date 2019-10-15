import 'package:flutter/material.dart';
import 'package:hijra/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CardSetting extends StatelessWidget {
  final String title;
  final Widget leading;
  final Color defaultColor;
  final Color textColor;

  CardSetting(
      {@required this.title,
      @required this.leading,
      this.defaultColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: Card(
        color: defaultColor ?? theme.primaryColor,
        elevation: 0,
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(color: textColor ?? theme.primaryColor),
          ),
          trailing: leading,
        ),
      ),
    );
  }
}
