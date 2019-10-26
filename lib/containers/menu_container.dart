import 'package:flutter/material.dart';
import 'package:hijra/components/menu_item.dart';
import 'package:hijra/screens/quran_screen.dart';

class MenuContainer extends StatelessWidget {
  final List<String> menus = [
    'Al-Quran',
    'Asmaul Husna',
    'Doa Harian',
    'Coming Soon'
  ];

  final List<String> images = [
    'assets/quran.jpg',
    'assets/asmaul.png',
    'assets/hadits.jpg',
    'assets/coming-soon.jpg',
  ];

  final List<Widget> screens = [QuranScreen()];

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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screens[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
