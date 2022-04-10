import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io' show Platform;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/Services/API/Services/user_services.dart';

class LocallAuthReturn {
  bool success;
  String message;

  LocallAuthReturn({this.message = "nothing to return", this.success = true});

  void setScuess(bool _success) {
    this.success = _success;
  }

  void setMessage(String _message) {
    this.message = _message;
  }
}

class Register_Controller {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final User_SERVICES user_services = User_SERVICES();
  LocalStroageController localStroageController =
      Get.find<LocalStroageController>();

  final String email;
  final String password;
  final String name;
  final String userName;
  String? userID;

  final LocallAuthReturn locallAuthReturn = LocallAuthReturn();

  Register_Controller(this.email, this.password, this.name, this.userName);

  start() async {
    if (!fieldsValidator()) return locallAuthReturn;
    if (!await signupToFireAuth()) return locallAuthReturn;
    if (!await createUserRecord()) return locallAuthReturn;

    return locallAuthReturn;
  }

  bool fieldsValidator() {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      locallAuthReturn.setMessage("all fileds are required");
      locallAuthReturn.setScuess(false);
      return false;
    }
    if (userName.length > 15) {
      locallAuthReturn.setMessage("email chars should be less than 15 char");
      locallAuthReturn.setScuess(false);
      return false;
    }
    if (email.length > 30) {
      locallAuthReturn.setMessage("email chars should be less than 30 char");
      locallAuthReturn.setScuess(false);
      return false;
    }
    if (name.length > 30) {
      locallAuthReturn.setMessage("email chars should be less than 30 char");
      locallAuthReturn.setScuess(false);
      return false;
    }
    if (!email.contains("@")) {
      locallAuthReturn.setMessage("plase enter a valid email");
      locallAuthReturn.setScuess(false);
      return false;
    }

    // if (userName.contains((RegExp(r'[A-Z]')))) {
    //     locallAuthReturn.setMessage("plase enter a valid userName";
    //   locallAuthReturn.setScuess(false;
    //   return false;
    // }
    if (password.length < 6 || password.length > 30) {
      locallAuthReturn
          .setMessage("password should be more than 6 and less than 30");
      locallAuthReturn.setScuess(false);
      return false;
    }

    return true;
  }

  Future<bool> signupToFireAuth() async {
    try {
      userID = await auth
          .createUserWithEmailAndPassword(
              email: this.email, password: this.password)
          .then((value) => value.user!.uid);
    } on FirebaseAuthException catch (error) {
      print(
          "Firebase Error: Register_Controller/signupToFireAuth : ${error.message}");
      locallAuthReturn.setMessage("Firebase Error: ${error.message}");
      locallAuthReturn.setScuess(false);
      return false;
    }

    return true;
  }

  createUserRecord() async {
    Response_Model response_Model = await user_services.create_User(
      User_MODEL(
          userID: userID,
          name: this.name,
          userName: this.userName,
          email: this.email,
          tokens: [
            UserToken_MODEL(
                token: await firebaseMessaging.getToken(),
                platform: Platform.operatingSystem),
          ],
          status: UserStatus_MODEL(isActive: true, state: "User is Active")),
    );

    if (!response_Model.success) {
      locallAuthReturn.setMessage(response_Model.message!);
      locallAuthReturn.setScuess(false);
    } else {
      localStroageController.deleteUser();
      localStroageController.setUser(response_Model.toModel(User_MODEL()));
    }

    return response_Model.success;
  }
}

class Login_Controller {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final User_SERVICES user_services = User_SERVICES();
  LocalStroageController localStroageController =
      Get.find<LocalStroageController>();

  final String email;
  final String password;

  final LocallAuthReturn locallAuthReturn = LocallAuthReturn();
  String? userID;

  Login_Controller(this.email, this.password);

  start() async {
    if (!await firebaseLogin()) return locallAuthReturn;
    if (!await fetchUserdata()) return locallAuthReturn;

    return locallAuthReturn;
  }

  Future<bool> firebaseLogin() async {
    try {
      userID = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => value.user!.uid);
    } on FirebaseException catch (error) {
      locallAuthReturn.setMessage("Firebase Error: ${error.message} ");
      locallAuthReturn.setScuess(false);
      print("fireauthError Login_Controller/firebaseLogin: ${error.message}");
      return false;
    }

    return true;
  }

  Future<bool> fetchUserdata() async {
    Response_Model response = await user_services.get_User(userID!);

    if (!response.success) {
      locallAuthReturn.setMessage(response.message!);
      locallAuthReturn.setScuess(false);
    } else {
      localStroageController.deleteUser();
 
      localStroageController.setUser(response.toModel(User_MODEL()));
    }

    return response.success;
  }
}
