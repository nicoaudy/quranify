import 'package:flutter/material.dart';
import 'package:hijra/components/card_slider.dart';
import 'package:hijra/providers/setting_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: <Widget>[
          CardSlider(
            title: 'Ukuran teks terjemahan',
            slider: Slider(
              activeColor: Theme.of(context).primaryColorLight,
              inactiveColor: Theme.of(context).primaryColorLight,
              min: 0.5,
              value: setting.sliderArabSize,
              onChanged: (newValue) => setting.arabSize = newValue,
            ),
            trailing: setting.arabSize.toInt().toString(),
          )
        ],
      ),
    );
  }
}
