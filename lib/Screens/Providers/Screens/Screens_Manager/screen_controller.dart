import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Auth/auth_screen.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Direct/direct_screen.dart';
import 'package:kodirect/Screens/Info/info_screen.dart';
import 'package:kodirect/Screens/Posts/post_screen.dart';
import 'package:kodirect/Screens/Profile/Functions/proflie_controller.dart';
import 'package:kodirect/Screens/Profile/proflie_screen.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Screens/Send/SendScreen.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';

class ScreenController extends GetxController {
  List<Screen_MODEL> Screens = [];
  Screen_MODEL CurrentScreen = Screen_MODEL();

  FirebaseAuth _auth = FirebaseAuth.instance;

  // ==== > SCREENS
  Screen_MODEL? Screen1;
  Screen_MODEL? Screen2;
  Screen_MODEL? Screen3;
  Screen_MODEL? Screen4;
  Screen_MODEL? Screen5;
  Screen_MODEL? Screen6;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    Get.put(AuthController());
    Get.put(LocalStroageController());
    Get.put(ProflieController());

    init_Screens();
    Screens = [Screen1!, Screen2!, Screen3!, Screen4!, Screen5!];
    CurrentScreen = Screens[2];
  }

  // User? user;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    _auth.authStateChanges();

    if (_auth.currentUser != null) {
      Screens.remove(Screen1);
      Screens.insert(0, Screen6!);
      update();
    }
  }

  void onBottomBarScreenPicked(screen) {
    CurrentScreen = screen;
    update();
  }

  void init_Screens() {
    Screen1 = Screen_MODEL(
        index: 0,
        icon: FontAwesomeIcons.user,
        title: "Login",
        screen: AuthScreen());

    Screen6 = Screen_MODEL(
        index: 0,
        icon: FontAwesomeIcons.user,
        title: "Proflie",
        screen: ProfileScreen());

    Screen2 = Screen_MODEL(
        index: 1,
        icon: FontAwesomeIcons.image,
        title: "Posts",
        screen: PostsScreen());
    Screen3 = Screen_MODEL(
        index: 2,
        icon: FontAwesomeIcons.mailBulk,
        title: "Direct",
        screen: DirectScreen());
    Screen4 = Screen_MODEL(
        index: 3,
        icon: FontAwesomeIcons.telegram,
        title: "SendToMany",
        screen: SendScreen());

    Screen5 = Screen_MODEL(
        index: 4,
        icon: FontAwesomeIcons.info,
        title: "Info",
        screen: InfoScreen());
  }
}
