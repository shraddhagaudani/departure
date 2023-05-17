

import 'package:departure/controllers/providers/app_provider.dart';
import 'package:departure/models/app_model.dart';
import 'package:departure/splashscreen_page.dart';
import 'package:departure/utills/utills.dart';
import 'package:departure/views/screens/details_page.dart';
import 'package:departure/views/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isdark = preferences.getBool('isdark') ?? false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PopUpMenuButton_Provider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeAccess_Provider(
            themeAccess_Model: ThemeAccess_Model(
              isdark: isdark,
            ),
          ),
        ),
        // ChangeNotifierProvider(create: (context) => ShlokProvider(),),

      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: AppTheme.lighttheme,
            darkTheme: AppTheme.darktheme,
            themeMode: (Provider.of<ThemeAccess_Provider>(context)
                        .themeAccess_Model
                        .isdark ==
                    false)
                ? ThemeMode.light
                : ThemeMode.dark,
            initialRoute: 'Splashscreen_page',
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => const Home_page(),
              'Splashscreen_page': (context) => const Splashscreen_page(),
              'Details_page' : (context) => const Details_page(),
            },
          );
        },
      ),
    ),
  );
}
