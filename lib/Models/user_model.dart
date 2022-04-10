// import 'dart:convert';
// import 'dart:core';
class User_MODEL {
  final int? id;
  final String? userID;
  final String? userName;
  final String? profiePicture;
  final String? email;
  final String? name;
  final List<UserToken_MODEL>? tokens;
  final String? doj;
  final UserStatus_MODEL? status;
  final String? role;

  User_MODEL({
    this.userID,
    this.id,
    this.profiePicture,
    this.userName,
    this.email,
    this.name,
    this.doj,
    this.tokens,
    this.status,
    this.role,
  });

  doesExist() {
    return this.id != null;
  }

  factory User_MODEL.fromJson(Map<String, dynamic> data) {
    // print("from User Model fromJson Method id: ${data["id"]}");
    return User_MODEL(
      id: data["id"] ?? 0,
      userID: data["userID"] ?? "",
      userName: data["userName"] ?? "",
      profiePicture: data["profiePicture"] ?? "",
      email: data["email"] ?? "",
      name: data["name"] ?? "",
      role: data["role"] ?? "",
      doj: data["created_at"] ?? "",
      // tokens: List<Map<String, dynamic>>.from(data["tokens"])
      //         .map((token) => UserToken_MODEL.fromJson(token))
      //         .toList() ??
      //     [],
      status: data["status"] != null
          ? UserStatus_MODEL.fromJson(data["status"])
          : UserStatus_MODEL(),
    );
  }

  toThing(Map<String, dynamic> data) {
    print("from User Model toThing Method id: ${data["id"]}");
    return User_MODEL(
      id: data["id"] ?? 0,
      userID: data["userID"] ?? "",
      userName: data["userName"] ?? "",
      profiePicture: data["profiePicture"] ?? "",
      email: data["email"] ?? "",
      name: data["name"] ?? "",
      role: data["role"] ?? "",
      doj: data["created_at"] ?? "",
      // tokens: List<Map<String, dynamic>>.from(data["tokens"])
      //         .map((token) => UserToken_MODEL.fromJson(token))
      //         .toList() ??
      //     [],
      status: data["status"] != null
          ? UserStatus_MODEL.fromJson(data["status"])
          : UserStatus_MODEL(),
    );
  }

  // doesExsist() {
  //   return this.id == null;
  // }

  toStore() {
  
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "userID": userID,
      "name": name,
      "tokens": tokens?.map((token) => token.toStore()).toList() ?? [],
      "status": status?.toStore(),
    };
  }
}

class UserToken_MODEL {
  final int? id;
  final String? token;
  final String? platform;

  UserToken_MODEL({this.id, this.token, this.platform});

  factory UserToken_MODEL.fromJson(Map<String, dynamic> data) {
    return UserToken_MODEL(
      id: data["id"] ?? 0,
      token: data["token"] ?? "",
      platform: data["platform"] ?? "",
    );
  }

  toStore() {
    return {"token": this.token, "platform": this.platform};
  }
}

class UserStatus_MODEL {
  final int? id;
  final bool? isActive;
  final String? state;

  UserStatus_MODEL({this.id, this.isActive, this.state});

  factory UserStatus_MODEL.fromJson(Map<String, dynamic> data) {
    return UserStatus_MODEL(
      id: data["id"] ?? 0,
      isActive: data["isActive"] == 1 ? true : false,
      state: data["state"] ?? "",
    );
  }

  toStore() {
    return {"isActive": this.isActive, "state": this.state};
  }
}
