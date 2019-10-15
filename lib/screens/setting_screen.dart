import 'package:flutter/material.dart';
import 'package:hijra/components/card_slider.dart';
import 'package:hijra/components/card_switch.dart';
import 'package:hijra/providers/setting_provider.dart';
import 'package:hijra/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final setting = Provider.of<SettingProvider>(context);
    final theme = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: <Widget>[
          CardSwitch(
            title: 'Tema Gelap',
            leading: Switch(
              value: theme.isDark,
              onChanged: (payload) => theme.setTheme(),
            ),
          ),
          CardSwitch(
            title: 'Tampilkan Tafsir',
            leading: Switch(
              value: setting.tafsir,
              onChanged: (payload) => setting.tafsir = payload,
            ),
          ),
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
