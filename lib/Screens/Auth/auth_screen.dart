import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Widgets/MyAppBar.dart';
import 'package:kodirect/Screens/Providers/Widgets/MySwitchButton.dart';
import 'package:kodirect/UI/Constant.dart';

import 'Widgets/login_form.dart';
import 'Widgets/register_form.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: GetBuilder<AuthController>(
        init: Get.find<AuthController>(),
        builder: (controller) => Stack(
          children: [
            MyAppBar(
              height: _height * 0.7,
              menuClikced: (drawerStatus) {
                var clicked = drawerStatus;
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 120),
              child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.bottomRight,
                children: [
                  Positioned(
                      bottom: -300,
                      child: Image.asset("assets/Images/Login_bg.png")),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: controller.login ? 550 : 600,
                    margin: EdgeInsets.symmetric(
                        horizontal: kMainPadding, vertical: kMainPadding),
                    padding: EdgeInsets.symmetric(
                        vertical: kMainPadding * 1.5, horizontal: kMainPadding),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: kAlphaColor),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          MySwitchButton(
                              onChange: (page) {
                                controller.MySwitchButton(page);
                              },
                              option1: {"Label": "Login"},
                              option2: {"Label": "Sgin"},
                              color: kOmgaColor),
                          SizedBox(
                            height: kMainPadding * 3,
                          ),
                          controller.login
                              ? LoginForm(
                                  controller: controller,
                                )
                              : RegisterForm(
                                  controller: controller,
                                )
                        ],
                      ),
                    ),
                  ),
                  //// =============================
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
