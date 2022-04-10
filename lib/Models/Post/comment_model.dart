// To parse this JSON data, do
//
//     final Comment_MODEL = Comment_MODELFromJson(jsonString);

import 'dart:convert';

import 'package:kodirect/Models/user_model.dart';

class Comment_MODEL {
  final String? content;
  final int? userId;
  final int? postId;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;
  final User_MODEL? poster;

  Comment_MODEL(
      {this.content,
      this.userId,
      this.postId,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.poster});

  factory Comment_MODEL.fromJson(Map<String, dynamic> json) {
    return Comment_MODEL(
      content: json["content"] ?? "",
      userId: json["user_id"] ?? 0,
      postId: json["post_id"] ?? 0,
      updatedAt: DateTime.parse(json["updated_at"]),
      createdAt: DateTime.parse(json["created_at"]),
      poster: User_MODEL.fromJson(json["user"]),
      id: json["id"] ?? 0,
    );
  }

  toThing(Map<String, dynamic> json) {
    return Comment_MODEL(
      content: json["content"],
      userId: json["user_id"],
      postId: json["post_id"],
      updatedAt: DateTime.parse(json["updated_at"]),
      createdAt: DateTime.parse(json["created_at"]),
      poster: User_MODEL.fromJson(json["user"]),
      id: json["id"],
    );
  }

  Map<String, dynamic> toStore() =>
      {"content": content, "user_id": poster?.userID};
}
