import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_handler.dart';
import 'package:kodirect/Screens/Providers/Functions/Alert_Dilog.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Widgets/Alert_Dilog.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';
import 'package:kodirect/UI/Constant.dart';

import 'LoginViaWidget.dart';

class LoginForm extends StatelessWidget {
  // bool passVis = false;
  // bool loading = false;

  const LoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: kMainPadding * 1.5),
      child: Column(
        children: [
          Container(
              color: Colors.transparent,
              child: TextField(
                controller: controller.idController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: "Email or UserName"),
              )),
          SizedBox(
            height: kMainPadding,
          ),
          Container(
              color: Colors.transparent,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TextField(
                      controller: controller.loginpasswordController,
                      decoration: InputDecoration(hintText: "Password"),
                      obscureText: true),
                  Positioned(
                      right: 0,
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          FontAwesomeIcons.eye,
                          color: Colors.grey,
                          size: 20,
                        ),
                      ))
                ],
              )),
          SizedBox(
            height: kMainPadding / 2,
          ),
          InkWell(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: kMainPadding / 4),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forget your info?",
                  style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: kOmgaColor),
                )),
          ),
          SizedBox(
            height: kMainPadding * 2,
          ),
          Obx(
            () => Get.find<AuthController>().loading.value
                ? CircularProgressIndicator()
                : InkWell(
                    onTap: controller.onSginInButtonClicked,
                    child: Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 43.33,
                      decoration: BoxDecoration(
                          color: kOmgaColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        "Login ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "STC"),
                      ),
                    )),
          ),
          SizedBox(
            height: kMainPadding * 2.5,
          ),
          LoginViaWidget()
        ],
      ),
    );
  }
}
