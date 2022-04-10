// ignore: file_names

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';

const apiKey = "CCIgyp4OYlm2mnjr3oloJU";

const urlBase = "http://10.18.12.222:90/api";
// const urlBase = "http://192.168.1.58:90/api";

Map<String, String> header({String user_id = ""}) =>
    {'Content-Type': 'application/json', "key": apiKey, "user_id": user_id};

var client = http.Client();

// api general Info
Uri apiLink(String model) => Uri.parse("$urlBase/$model");

class Response_Model {
  var data;
  final String? message;
  final bool success;

  Response_Model({this.message, this.success = false, this.data});

  factory Response_Model.fromJson(Map<String, dynamic> _data) {
    return Response_Model(
        data: _data["data"],
        message: _data["message"],
        success: _data["success"]);
  }

  toListModels(Model) {
    if (data != null)
      return data.map((thing) => Model.toThing(thing)).toList();
    else
      return [];
  }

  toModel(Model) {
    if (data != null)
      return Model.toThing(data);
    else
      return Model;
  }
}

bodyToPost({userID, data}) {
  return {
    "data": data,
  };
}
