/// ==================================== [Model] ======================================
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Auth/auth_screen.dart';
import 'package:kodirect/Screens/Direct/direct_screen.dart';
import 'package:kodirect/Screens/Info/info_screen.dart';
import 'package:kodirect/Screens/Posts/post_screen.dart';
import 'package:kodirect/Screens/Profile/proflie_screen.dart';
import 'package:kodirect/Screens/Providers/Screens/ScriptScreen.dart';
import 'package:kodirect/Screens/Providers/Screens/SettingsScreen.dart';
import 'package:kodirect/Screens/Send/SendScreen.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';



class Screen_MODEL {
  var index;
  final title;
  final screen;
  // final futureScreen;
  final icon;
  // ValueChanged<Screen_MODEL> init;

  Screen_MODEL({this.index, this.title, this.screen, this.icon}) {}

  // init({changeLoginHieght = false}) {
  //   if (changeLoginHieght) appBar_MODEL.changeHeight(newHeight: 300);
  // }

  setIndex(int index) {
    this.index = index;
  }
}








// ========================================================================================\

class Drawer_MODEL {
  //
  var title;
  var icon;

  // Function
  var page;
  var function;
  var url;

  Drawer_MODEL({this.title, this.page, this.function, this.icon, this.url});
}

Drawer_MODEL Option1 =
    Drawer_MODEL(title: "Help", icon: Icons.help, page: ScriptScreen());

Drawer_MODEL Option2 = Drawer_MODEL(
    title: "Terms",
    icon: Icons.insert_drive_file_outlined,
    url:
        "https://stackoverflow.com/questions/58156806/how-do-set-text-line-height-in-flutter");

Drawer_MODEL Option3 = Drawer_MODEL(
  title: "More Apps",
  icon: Icons.apps,
);

Drawer_MODEL Option4 = Drawer_MODEL(
  title: "Rate us",
  icon: Icons.star_rate_sharp,
);

Drawer_MODEL Option5 = Drawer_MODEL(
  title: "Share App",
  icon: Icons.share,
);

Drawer_MODEL Option6 = Drawer_MODEL(
    title: "Settings", icon: Icons.settings, page: SettingsScreen());

Drawer_MODEL Option7 = Drawer_MODEL(
    title: "LogOut",
    icon: Icons.logout,
    function: () {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      firebaseAuth.signOut();
    });

// ignore: non_constant_identifier_names
List<Drawer_MODEL> MainMenu = [
  Option1,
  Option2,
  Option3,
  Option4,
  Option5,
  Option6,
];

// MainMenu.add(Option7);
