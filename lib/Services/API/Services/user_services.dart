import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// this servcies to handle user in my api server from creating and deleting updating and getting data as well
/// [1] -- [create_User] => A function to create a user and add it to the database
/// [2] -- [create_User] => A function to create a user and add it to the database

class User_SERVICES {
  static const model = "user";

  Future<Response_Model> create_User(User_MODEL user_info) async {
    try {
      final response = await client.post(apiLink("user/create"),
          headers: header(),
          body: json.encode({
            "info": user_info.toStore(),
          }));

      print(response);

      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        print(
            'ResponseError: Services/User/Create : status of ${response.statusCode}:\n ${"* " * 80}\n ${response.body} \n ${"* " * 80}');
        return Response_Model(
          success: false,
          message:
              "ResponseError: Services/User/Create : status of ${response.statusCode}",
        );
      }
    } catch (localError) {
      print("LocalError:Services/User/Create : $localError");
      return Response_Model(
          message: "LocalError:Services/User/Create : $localError",
          success: false);
    }
  }

  Future<Response_Model> get_User(String userID) async {
    try {
      final http.Response response =
          await http.get(apiLink("$model/$userID"), headers: header());

      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        print(
            "ResponseError: Services/User/Get : status of ${response.statusCode}");
        return Response_Model(
          success: false,
          message:
              "ResponseError: Services/User/Get : status of ${response.statusCode}",
        );
      }
    } catch (localError) {
      print("LocallError: Services/User/Get : $localError");
      return Response_Model(
          message: "LocallError: Services/User/Get : $localError",
          success: false);
    }
  }
}
