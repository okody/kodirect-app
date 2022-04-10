import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_handler.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Screens/Providers/Screens/Screens_Manager/home_screen.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:kodirect/main.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  LocalStroageController localStroageController =
      Get.put(LocalStroageController());

  RxBool get loading => _loading;
  RxBool _loading = false.obs;

  final Rxn<User> _user = Rxn<User>();
  bool get isUser => _user.value != null;

  @override
  void onInit() {
    // TODO: implement onInit
    //
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onInit
    super.onReady();
    _user.bindStream(_auth.authStateChanges());
  }

  // ================================== init =====================
  // bool PageUIWaiter = false;
  // void waiter() async {
  //   await Future.delayed(const Duration(milliseconds: 250), () {
  //     PageUIWaiter = true;
  //     update();
  //   });
  // }

  bool ShowPassword = false;
  void onPasswordEyeClicked() {
    ShowPassword = !ShowPassword;
  }

  // ================================= Chicker =================================

  // ================================= Sgin in =================================
  // Register Info
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController userNameController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  Future<void> onSginUpButtonClicked() async {
    Register_Controller register_controller = Register_Controller(
        emailController.text,
        passwordController.text,
        nameController.text,
        userNameController.text);
    _loading.value = true;
    LocallAuthReturn locallAuthReturn = await register_controller.start();
    _loading.value = false;
    update();
    if (!locallAuthReturn.success)
      Get.snackbar("${locallAuthReturn.message.split(":")[0]}",
          '${locallAuthReturn.message}',
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3));
    else
      Get.offAll(() => SplashScreen());
  }

  TextEditingController idController = TextEditingController(text: "");
  TextEditingController loginpasswordController =
      TextEditingController(text: "");

  Future<void> onSginInButtonClicked() async {
    Login_Controller login_controller = Login_Controller(
      idController.text,
      loginpasswordController.text,
    );
    _loading.value = true;
    LocallAuthReturn locallAuthReturn = await login_controller.start();
    _loading.value = false;

    update();

    if (!locallAuthReturn.success)
      Get.snackbar("${locallAuthReturn.message.split(":")[0]}",
          '${locallAuthReturn.message}',
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 3));
    else
      Get.offAll(() => SplashScreen());
  }

  /// ============================================ [Sgin Out ] ============================================
  sginOut() async {
    await _auth.signOut();
    localStroageController.deleteUser();
    update();
    Get.offAll(() => SplashScreen());
  }

  // ==================================
  bool login = true;
  void MySwitchButton(value) {
    if (value == 1)
      login = true;
    else
      login = false;

    update();
  }
}
