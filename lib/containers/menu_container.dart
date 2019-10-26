import 'package:flutter/material.dart';
import 'package:hijra/components/menu_item.dart';

class MenuContainer extends StatelessWidget {
  List<String> menus = [
    'Al-Quran',
    'Asmaul Husna',
    'Doa Harian',
    'Coming Soon'
  ];

  List<String> images = [
    'assets/quran.jpg',
    'assets/asmaul.png',
    'assets/hadits.jpg',
    'assets/coming-soon.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: menus.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.7),
        ),
        itemBuilder: (context, int index) {
          return MenuItem(
            image: images[index],
            title: menus[index],
            onTap: () => {},
          );
        },
      ),
    );
  }
}
