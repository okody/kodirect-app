import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Models/tage_model.dart';

class Post_MODEL {
  final int? id;
  final String? title;
  final String? imageUrl;
  final String? comment;
  final String? format;
  final DateTime? dop;
  final List<Tage_MODEL>? tages;
  final User_MODEL? poster;
  final List<Like_MODEL>? likes;
  final int? views_count;

  Post_MODEL(
      {this.likes,
      this.views_count,
      this.id,
      this.title,
      this.imageUrl,
      this.comment,
      this.format,
      this.dop,
      this.poster,
      this.tages});

  factory Post_MODEL.fromJson(Map<String, dynamic> data) {
    return Post_MODEL(
        id: data["id"] ?? 0,
        title: data["title"] ?? "",
        imageUrl: data["imageUrl"] ?? "",
        comment: data["comment"] ?? "",
        format: data["format"] ?? "",
        dop: data["created_at"] ?? "",
        views_count: data["views_count"] ?? 0,
        likes:
            data["likes"].map((like) => Like_MODEL.fromJson(like)).toList() ??
                []
        // tages:
        //     data["tages"].map((tage) => Tage_MODEL.fromJson(tage)).toList() ?? [],
        // poster: User_MODEL.fromJson(data["user"]),
        );
  }
  toThing(Map<String, dynamic> data) {
    // print("from usermodel tothing model: ${data}");
    return Post_MODEL(
        id: data["id"] ?? 0,
        title: data["title"] ?? "",
        imageUrl: data["imageUrl"] ?? "",
        comment: data["comment"] ?? "",
        format: data["format"] ?? "",
        dop: DateTime.parse(data["created_at"]),
        views_count: data["views_count"] ?? 0,
        likes: List<Like_MODEL>.from(
            data["likes"].map((like) => Like_MODEL.fromJson(like)).toList())

        // tages:
        //     data["tages"].map((tage) => Tage_MODEL.fromJson(tage)).toList() ?? [],
        // poster: User_MODEL.fromJson(data["user"]),
        );
  }

  Map<String, dynamic> toStore() {
    return {
      "id": id,
      "title": title,
      "imageUrl": imageUrl,
      "comment": comment,
      "format": format,
      "dop": dop,
      "tages": tages?.map((tage) => tage.name).toList(),
      "user_id": poster?.userID,
    };
  }
}

// class Comment_MODEL {
//   final int? id;
//   final String? content;
//   final int? userID;
//   final int? postID;
//   final DateTime? dop;

//   Comment_MODEL(this.id, this.content, this.userID, this.postID, this.dop);

//   factory Comment_MODEL.fromJson(Map<String, dynamic> data) {
//     return Comment_MODEL(
//       id: data["id"],
//       content: data["title"],
//       userID: data["imageUrl"],
//       comment: data["comment"],
//       comment: data["comment"],
//     );
//   }
// }

class Like_MODEL {
  final int? userID;
  final String? userCode;
  final int? postId;

  Like_MODEL({this.userID, this.postId, this.userCode});

  factory Like_MODEL.fromJson(Map<String, dynamic> data) {
    return Like_MODEL(postId: data["post_id"], userID: data["user_id"]);
  }

  bool if_user_like_post(int current_user_id) {
    return current_user_id == userID;
  }
}

class View_MODEL {
  final int? userID;
  final String? userCode;
  final int? postId;

  View_MODEL({this.userID, this.postId, this.userCode});

  factory View_MODEL.fromJson(Map<String, dynamic> data) {
    return View_MODEL(postId: data["post_id"], userID: data["user_id"]);
  }
}
