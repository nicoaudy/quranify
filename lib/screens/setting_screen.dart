import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/material_picker.dart';
import 'package:flutter_colorpicker/utils.dart';
import 'package:hijra/components/card_setting.dart';
import 'package:hijra/components/card_slider.dart';
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
          CardSetting(
            title: 'Tema Gelap',
            leading: Switch(
              value: theme.isDark,
              onChanged: (payload) => theme.setTheme(),
            ),
          ),
          CardSetting(
            title: 'Tampilkan Tafsir',
            leading: Switch(
              value: setting.tafsir,
              onChanged: (payload) => setting.tafsir = payload,
            ),
          ),
          CardSetting(
            title: 'Ubah Warna*',
            defaultColor: Theme.of(context).primaryColorLight,
            textColor: Theme.of(context).primaryColor,
            leading: RaisedButton(
              elevation: 3.0,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      titlePadding: const EdgeInsets.all(0.0),
                      contentPadding: const EdgeInsets.all(0.0),
                      content: SingleChildScrollView(
                        child: MaterialPicker(
                          pickerColor: theme.primaryColor,
                          onColorChanged: (payload) {
                            theme.primaryColor = payload;
                            Navigator.pop(context);
                          },
                          enableLabel: true,
                        ),
                      ),
                    );
                  },
                );
              },
              shape: CircleBorder(),
              color: theme.primaryColor,
              textColor: useWhiteForeground(theme.primaryColor)
                  ? const Color(0xffffffff)
                  : const Color(0xff000000),
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
