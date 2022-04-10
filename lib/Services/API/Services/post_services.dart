import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// this servcies to handle user in my api server from creating and deleting updating and getting data as well
/// [1] -- [create_User] => A function to create a user and add it to the database

class Post_SERVICES {
  static const model = "post";
  var client = http.Client();

  Future<Response_Model> get_posts({String tage = "" , user_id = ""}) async {
    try {
      final http.Response response =
          await client.get(apiLink("$model"), headers: header(user_id: user_id));
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

  // Future<Response_Model> get_User_Posts(userID) async {
  //   try {
  //     final http.Response response = await http.get(
  //         apiLink("post?apikey=$apiKey&userID=$userID"),
  //         headers: header(user_id: userID));

  //     if (response.statusCode == 200) {
  //       return Response_Model.fromJson(json.decode(response.body));
  //     } else {
  //       return Response_Model(
  //         success: false,
  //         message:
  //             "ResponseError: status of ${response.statusCode} | server  isn't reachable",
  //       );
  //     }
  //   } catch (localError) {
  //     return Response_Model(
  //         message: "LocallError: ${localError}", success: false);
  //   }
  // }

  Future<Response_Model> create_post(Post_MODEL post_info) async {
    try {
      final response = await client.post(apiLink("$model/create"),
          headers: header(user_id: "${post_info.poster!.userID}"),
          body: json.encode({
            "data": post_info.toStore(),
          }));

      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        print(
            'ResponseError: Services/Post/Create -> status of ${response.statusCode}:\n ${"* " * 80}\n ${response.body} \n ${"* " * 80}');
        return Response_Model(
          success: false,
          message:
              "ResponseError: Services/[Post]/Create -> status of ${response.statusCode}",
        );
      }
    } catch (localError) {
      print("LocalError:Services/Post/Create : $localError");
      return Response_Model(
          message: "LocalError:Services/Post/Create : $localError",
          success: false);
    }
  }
}
