import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStroageController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  RxString _Lang = "en".obs;
  SharedPreferences? prefs;
  User_MODEL? _user_data;
  User_MODEL? get user_data => _user_data;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    _getLang();
    _user_data = _getUser();
  }

  /// ======================================= [Langauge] =======================================
  Future<void> _getLang() async {
    String? value = prefs!.getString("Lang") ?? "en";
    _Lang(value);
  }

  Future<void> setLang(String Lang) async {
    await prefs!.setString('Lang', Lang);
  }

  /// ======================================= [User] =======================================
  User_MODEL _getUser() {
    String? value = prefs!.getString("User") ?? "";
   
    update();
    if (value.isNotEmpty)
      return User_MODEL.fromJson(json.decode(value));
    else
      return User_MODEL();
  }

  Future<void> setUser(User_MODEL User) async {
  
    await prefs!.setString('User', json.encode(User.toStore()));
     print("from localstoreage after set user:${prefs!.getString("User")}");
  }

  Future<void> deleteUser() async {
    await prefs!.setString("User", "");
  }
}
