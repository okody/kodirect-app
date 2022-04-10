import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// this servcies to handle user in my api server from creating and deleting updating and getting data as well
/// [1] -- [create_User] => A function to create a user and add it to the database

class Tage_SERVICES {
  static const model = "tage";
  var client = http.Client();

  Future<Response_Model> get_tags() async {
    try {
      final http.Response response =
          await client.get(apiLink("$model"), headers: header());
      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        return Response_Model(
          success: false,
          message: "ResponseError: status of ${response.statusCode}",
        );
      }
    } catch (localError) {
      return Response_Model(
          message: "LocallError: $localError", success: false);
    }
  }




}
