import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_handler.dart';
import 'package:kodirect/Screens/Providers/Functions/Alert_Dilog.dart';
import 'package:kodirect/Screens/Providers/Screens/Screens_Manager/home_screen.dart';
import 'package:kodirect/Screens/Providers/Widgets/Alert_Dilog.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';
import 'package:kodirect/UI/Constant.dart';

import 'LoginViaWidget.dart';

class RegisterForm extends StatelessWidget {
  // var nameError;
  // var passwordError;
  // var userNameError;
  // var emailError;

  const RegisterForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    // controller.waiter();
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceInOut,
      padding: EdgeInsets.symmetric(horizontal: kMainPadding * 1.5),
      child: Column(
        children: [
          Container(
              color: Colors.transparent,
              child: TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              )),
          SizedBox(
            height: kMainPadding,
          ),
          Container(
              color: Colors.transparent,
              child: TextFormField(
                controller: controller.userNameController,
                decoration: InputDecoration(hintText: "UserName"),
              )),
          SizedBox(
            height: kMainPadding,
          ),
          Container(
              color: Colors.transparent,
              child: TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              )),
          SizedBox(
            height: kMainPadding,
          ),
          Container(
              color: Colors.transparent,
              child: TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffix: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.grey,
                          ),
                          onPressed: controller.onPasswordEyeClicked)),
                  obscureText: controller.ShowPassword)),
          SizedBox(
            height: kMainPadding * 2,
          ),
          InkWell(
              onTap: () => controller.onSginUpButtonClicked(),
              child: Obx(() => Get.find<AuthController>().loading.value
                  ? CircularProgressIndicator()
                  : Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 43.33,
                      decoration: BoxDecoration(
                          color: kOmgaColor,
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Text(
                        "Sgin in ",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "STC"),
                      ),
                    ))),
          SizedBox(
            height: kMainPadding * 2.5,
          ),
          LoginViaWidget()
        ],
      ),
    );
  }
}
