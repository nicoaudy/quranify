import 'package:flutter/material.dart';
import 'package:hijra/app.dart';
import 'package:hijra/providers/surah_info_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            builder: (_) => SurahInfoProvider(),
          ),
        ],
        child: App(),
      ),
    );
