import 'package:departure/models/app_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PopUpMenuButton_Provider extends ChangeNotifier {
  PopUpMenuButton_Model popUpMenuButton_Model = PopUpMenuButton_Model(
    initialval: null,
  );
}

class ThemeAccess_Provider extends ChangeNotifier {
  ThemeAccess_Model themeAccess_Model;

  ThemeAccess_Provider({
    required this.themeAccess_Model,
  });

  ChangeTheme() async {
    themeAccess_Model.isdark = !themeAccess_Model.isdark;
    notifyListeners();

    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setBool(
      'isdark',
      themeAccess_Model.isdark,
    );
    notifyListeners();
  }
}
