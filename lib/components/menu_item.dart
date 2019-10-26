import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String image;
  final String title;

  MenuItem({
    @required this.image,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                height: 1.2,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
