import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/Post/comment_model.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Posts/Functions/DateFormat.dart';
import 'package:kodirect/Screens/Posts/Functions/postFeature_controller.dart';
import 'package:kodirect/Services/API/Services/postfeature_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:kodirect/UI/Resposivity/baseWidget.dart';
import 'package:provider/provider.dart';

import 'comment_detials_widget.dart';

postDetailsScreen(context, Post_MODEL post_data) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: kAlphaColor,
            centerTitle: true,
            title: Text(
              post_data.title.toString(),
              style: TextStyle(
                  fontFamily: "STC", fontSize: 20, color: Colors.white),
            ),
          ),
          body: MainWidget(
            post_data: post_data,
          ),
        );
      });
}

class MainWidget extends StatelessWidget {
  const MainWidget({
    Key? key,
    required this.post_data,
  }) : super(key: key);

  final Post_MODEL post_data;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostFeatureController>(
        init: Get.put(PostFeatureController()),
        builder: (controller) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: kAlphaGridentColors50)),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    vertical: kMainPadding, horizontal: kMainPadding),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: kMainPadding / 2),
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white)),
                            ),
                            SizedBox(
                              width: kMainPadding / 2,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${post_data.poster?.name}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "STC",
                                        color: Colors.grey[50],
                                      )),
                                  Row(
                                    children: [
                                      Text(
                                          TimeAgo()
                                              .timeAgoSinceDate(post_data.dop!),
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            fontFamily: "STC",
                                            color: Colors.grey[300],
                                          )),
                                      SizedBox(width: kMainPadding / 4),
                                      Icon(
                                        Icons.timer,
                                        color: Colors.grey[300],
                                        size: 25,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(minHeight: 300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: kMainPadding / 2),
                                // width: 300,
                                // height: 300,
                                decoration: BoxDecoration(
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Image(
                                  image: NetworkImage(
                                      post_data.imageUrl.toString()),
                                  // height: 500,
                                  // width: 500,
                                ),
                              ),
                            ),
                            BaseWidget(buidler: (context, deviceInfo) {
                              // print(deviceInfo.localHeight);
                              return Container(
                                // height: 300,
                                padding: EdgeInsets.symmetric(
                                    vertical: kMainPadding * 3),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.download,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.message,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: kMainPadding / 4,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            // color: kOmgaColor,
                            // border: Border.all(color: kAlphaColor),
                            borderRadius: BorderRadius.circular(25.0)),
                        padding: EdgeInsets.symmetric(
                          horizontal: kMainPadding,
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: kMainPadding / 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            !Get.find<AuthController>().isUser
                                ? SizedBox.shrink()
                                : InkWell(
                                    onTap: () {
                                      // controller.upload_like();
                                      print("test");
                                      // print(post_data);
                                      print(post_data.toStore());
                                    },
                                    child: Icon(
                                      controller.if_user_like_post(
                                              post_data.likes!)
                                          ? Icons.favorite
                                          : Icons.favorite,
                                      color: Colors.red,
                                      size: 35,
                                    ),
                                  ),
                            Row(
                              children: [
                                // Views Row
                                Text("Likes: ${post_data.likes!.length}",
                                    style: TextStyle(
                                      fontFamily: "STC",
                                      fontSize: 17.5,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: kMainPadding,
                                ),
                                // Likes Row

                                Text("Views: ${post_data.views_count!}",
                                    style: TextStyle(
                                      fontFamily: "STC",
                                      fontSize: 17.5,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                          color: Colors.white,
                          thickness: 1.5,
                          height: kMainPadding),
                      CommentSection(context, controller)
                    ],
                  ),
                ),
              ),
              !Get.find<AuthController>().isUser
                  ? SizedBox.shrink()
                  : Container(
                      color: kAlphaColor.withOpacity(0.75),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          controller.loading.value
                              ? Center(child: CircularProgressIndicator())
                              : GestureDetector(
                                  onTap: () => controller.upload_comment(),
                                  child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: kMainPadding / 2),
                                      child: Text(
                                        "Post",
                                        style: TextStyle(
                                            fontFamily: "STC",
                                            fontSize: 17.5,
                                            color: Colors.white),
                                      )),
                                ),
                          Expanded(
                            child: TextField(
                              // controller: message,
                              textAlign: TextAlign.right,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1000),
                              ],
                              maxLines: null,
                              controller: controller.commentTextController,
                              // maxLength: kMessageFieldLength,
                              style: TextStyle(
                                  fontFamily: "STC",
                                  fontSize: 15,
                                  color: Colors.white),
                              decoration: InputDecoration(
                                fillColor: Colors.grey,
                                hintText: "......   اكتب تعليقك هنا",
                                hintStyle: TextStyle(
                                    fontSize: 12.5, color: Colors.white),
                                border: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(25),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          );
        });
  }

  Widget CommentSection(
      BuildContext context, PostFeatureController controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Comments",
                style: TextStyle(
                  fontFamily: "STC",
                  fontSize: 17.5,
                  color: Colors.white,
                )),
            Icon(Icons.comment, size: 35, color: Colors.grey[200]),
            // SizedBox(width: kMainPadding / 2),
          ],
        ),
        Container(
          // height: 220,
          margin: EdgeInsets.only(bottom: kMainPadding * 2),
          child: SingleChildScrollView(
            child: controller.loading.value
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: controller.GetComments.map(
                        (comment) => CommentDetails(comment, context)).toList(),
                  ),
          ),
        )
      ],
    );
  }
}
