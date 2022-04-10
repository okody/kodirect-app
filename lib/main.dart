// @dart=2.9

// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Providers/Functions/Binding.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:device_preview/device_preview.dart';

// void main() {
//   runApp(DevicePreview(builder: (context) => Main_Class()));
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Main_Class());
}

class Main_Class extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Main_Class();
  }
}

class _Main_Class extends State<Main_Class> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetMaterialApp(
        initialBinding: MainBinding(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar"),
          Locale("en") // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale("en"),
        debugShowCheckedModeBanner: false,
        title: "Kody",
        theme:
            ThemeData(brightness: Brightness.light, primaryColor: kAlphaColor),
        home: SplashScreen());
  }
}
