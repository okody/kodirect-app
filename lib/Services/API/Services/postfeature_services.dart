import 'package:kodirect/Models/Post/comment_model.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// this servcies to handle user in my api server from creating and deleting updating and getting data as well
/// [1] -- [create_User] => A function to create a user and add it to the database

class PostFeature_SERVICES {
  static const model = "comment";

  Future<Response_Model> get_comments(int PostID) async {
    try {
      final http.Response response =
          await http.get(apiLink("post/$PostID/comment"), headers: header());

      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        return Response_Model(
          success: false,
          message:
              "ResponseError: status of ${response.statusCode} | server  isn't reachable",
        );
      }
    } on http.ClientException catch (localError) {
      return Response_Model(
          message: "LocallError: ${localError.message}", success: false);
    }
  }

  Future<Response_Model> get_User_Comments(userID) async {
    try {
      final http.Response response = await http.get(
        apiLink("comment?apikey=$apiKey&userID=$userID"),
        //     headers: {
        //   // "apikey": apiKey,
        //   // "userID": "dsaoifjaoiwfjoiwjefaw",
        //   // "data": json.encode(user_info.toStore()),
        // }
      );

      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        return Response_Model(
          success: false,
          message:
              "ResponseError: status of ${response.statusCode} | server  isn't reachable",
        );
      }
    } catch (localError) {
      return Response_Model(
          message: "LocallError: $localError", success: false);
    }
  }



  Future<Response_Model> create_comment(Comment_MODEL comment_info) async {
    try {
      // headers["user_id"] = comment_info.poster!.userID!;
      final response = await client.post(
          apiLink("post/${comment_info.postId}/$model/create?apikey=$apiKey"),
          headers: header(user_id: "${comment_info.poster!.userID}"),
          body: json.encode({
            "data": comment_info.toStore(),
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

  Future<Response_Model> create_like(Like_MODEL liek_info) async {
    try {
      // headers["user_id"] = comment_info.poster!.userID!;
      final response = await client.post(
          apiLink("post/${liek_info.postId}/like/create?apikey=$apiKey"),
          headers: header(user_id: "${liek_info.userCode}"),
          body: json.encode({}));

      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        print(
            'ResponseError: Services/Like/Create -> status of ${response.statusCode}:\n ${"* " * 80}\n ${response.body} \n ${"* " * 80}');
        return Response_Model(
          success: false,
          message:
              "ResponseError: Services/[Like]/Create -> status of ${response.statusCode}",
        );
      }
    } catch (localError) {
      print("LocalError:Services/Like/Create : $localError");
      return Response_Model(
          message: "LocalError:Services/Like/Create : $localError",
          success: false);
    }
  }

    Future<Response_Model> create_view(View_MODEL view_info) async {
    try {
      // headers["user_id"] = comment_info.poster!.userID!;
      final response = await client.post(
          apiLink("post/${view_info.postId}/view/create?apikey=$apiKey"),
          headers: header(user_id: "${view_info.userCode}"),
          body: json.encode({}));

      if (response.statusCode == 200) {
        return Response_Model.fromJson(json.decode(response.body));
      } else {
        print(
            'ResponseError: Services/view/Create -> status of ${response.statusCode}:\n ${"* " * 80}\n ${response.body} \n ${"* " * 80}');
        return Response_Model(
          success: false,
          message:
              "ResponseError: Services/[view]/Create -> status of ${response.statusCode}",
        );
      }
    } catch (localError) {
      print("LocalError:Services/view/Create : $localError");
      return Response_Model(
          message: "LocalError:Services/view/Create : $localError",
          success: false);
    }
  }


}
