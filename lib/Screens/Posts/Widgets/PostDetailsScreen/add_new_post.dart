import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kodirect/Models/Post/comment_model.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Screens/Posts/Functions/post_controller.dart';
import 'package:kodirect/Services/API/Services/postfeature_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:kodirect/UI/Resposivity/baseWidget.dart';
import 'package:provider/provider.dart';

import 'comment_detials_widget.dart';

class AddNewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New post",
          style: TextStyle(
            fontFamily: "STC",
          ),
        ),
      ),
      body: GetBuilder<PostController>(
        init: Get.find<PostController>(),
        builder: (controller) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: kMainPadding),
            child: Column(
              children: [
                Container(
                  // height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      // color: Colors.grey,
                      ),
                  child: Image(
                    image: FileImage(controller.image!),
                    width: _size.width,
                  ),
                ),
                SizedBox(
                  height: kMainPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMainPadding / 2),
                  child: TextField(
                    // textAlign: TextAlign.right,
                    // maxLines: null,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(50),
                    ],
                    // maxLength: kMessageFieldLength,
                    style: TextStyle(fontFamily: "STC", fontSize: 16),

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: kMainPadding, vertical: kMainPadding),
                      hintText: "My cat",
                      label: Text(
                        "Title*",
                        style: TextStyle(fontFamily: "STC", fontSize: 15),
                      ),
                      hintStyle: TextStyle(fontSize: 12.5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMainPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMainPadding / 2),
                  child: TextField(
                    // textAlign: TextAlign.right,
                    maxLines: 5,

                    inputFormatters: [
                      LengthLimitingTextInputFormatter(250),
                    ],
                    // maxLength: kMessageFieldLength,
                    style: TextStyle(fontFamily: "STC", fontSize: 16),

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: kMainPadding, vertical: kMainPadding),
                      hintText: "My cat",
                      label: Text(
                        "Description*",
                        style: TextStyle(fontFamily: "STC", fontSize: 15),
                      ),
                      hintStyle: TextStyle(fontSize: 12.5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                ),
                SizedBox(
                  height: kMainPadding,
                ),
                controller.loading.value
                    ? Center(child: CircularProgressIndicator())
                    : GestureDetector(
                        onTap: () => controller.upload_post(),
                        child: Container(
                            width: _size.width * 0.95,
                            height: 50,
                            decoration: BoxDecoration(
                                color: kAlphaColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Center(
                              child: Text("Post",
                                  style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 18,
                                    color: Colors.white,
                                  )),
                            )),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
