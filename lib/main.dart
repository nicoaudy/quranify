import 'package:flutter/material.dart';
import 'package:hijra/app.dart';
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
            builder: (_) => SettingProvider(),
          ),
        ],
        child: App(),
      ),
    );
