import 'package:flutter/material.dart';
import 'package:hijra/app.dart';
import 'package:hijra/providers/asmaul_husna_provider.dart';
import 'package:hijra/providers/doa_harian_provider.dart';
import 'package:hijra/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:hijra/providers/setting_provider.dart';
import 'package:hijra/providers/surah_info_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (_) => SurahInfoProvider(),
          ),
          ChangeNotifierProvider(
            builder: (_) => AsmaulHusnaProvider(),
          ),
          ChangeNotifierProvider(
            builder: (_) => DoaHarianProvider(),
          ),
          ChangeNotifierProvider(
            builder: (_) => SettingProvider(),
          ),
          ChangeNotifierProvider(builder: (_) => ThemeChanger(false)),
        ],
        child: App(),
      ),
    );
