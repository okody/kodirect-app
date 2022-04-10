import 'package:flutter/cupertino.dart';

ImageProvider defaultProfile(String url) {
  if (url.isEmpty)
    return AssetImage("assets/Images/user.png");
  else
    return NetworkImage(url);
}
