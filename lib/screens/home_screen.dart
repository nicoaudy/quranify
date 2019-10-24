import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                width: double.infinity,
                color: Color(getColorHexFromStr('#FDD148')),
              ),
              Positioned(
                bottom: 50.0,
                right: 100.0,
                child: Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200.0),
                      color: Color(getColorHexFromStr('#FEE16D'))
                          .withOpacity(0.4)),
                ),
              ),
              Positioned(
                bottom: 100.0,
                left: 150.0,
                child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150.0),
                        color: Color(getColorHexFromStr('#FEE16D'))
                            .withOpacity(0.5))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Become your subtitle",
                      style: TextStyle(
                        fontSize: 23.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search,
                              color: Color(getColorHexFromStr('#FEDF62')),
                              size: 30.0),
                          contentPadding:
                              EdgeInsets.only(left: 15.0, top: 15.0),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Stack(
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Material(
                        elevation: 1.0,
                        child: Container(height: 75.0, color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 75.0,
                            width: 50.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/quran.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'Quran',
                                  style: TextStyle(fontFamily: 'Quicksand'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 75.0,
                            width: 50.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/hadits.jpg'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  'Hadits',
                                  style: TextStyle(fontFamily: 'Quicksand'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 75.0,
                            width: 50.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    image: DecorationImage(
                                      image: AssetImage('assets/asmaul.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.0),
                                Text(
                                  'Husna',
                                  style: TextStyle(fontFamily: 'Quicksand'),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
