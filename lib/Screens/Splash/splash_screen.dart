import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Screens/Screens_Manager/home_screen.dart';
import 'package:kodirect/Services/API/Services/user_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}



class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    start();

    // TODO: implement initState
    super.initState();
  }

  start() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      // var user = await user_controller.getUserData();
      Get.offAll(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: kAlphaGridentColors)),
        child: Center(
            child: Image(
          image: AssetImage("assets/Images/Splash_Logo.png"),
          // height: 1000,
          // width: 1000,
        )
            //  Image.asset("assets/Images/App_logo.png" , width: 500, height: 500,),
            ),
      ),
    );
  }
}
