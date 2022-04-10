import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Screens/Posts/Functions/post_controller.dart';
import 'package:kodirect/Screens/Posts/Functions/tage_controller.dart';
import 'package:kodirect/UI/Constant.dart';

import 'PostDetailsScreen/post_details_screen.dart';

class TageDetailsScreen extends GetWidget<TageController> {
  @override
  Widget build(BuildContext context) {
    PostController postController = Get.find<PostController>();
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          postController.refresh_AllPosts();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kOmgaColor,
            elevation: 0.0,
            actions: [
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 40,
                margin: EdgeInsets.symmetric(
                    horizontal: kMainPadding / 2, vertical: kMainPadding / 2),
                decoration: BoxDecoration(
                    color: kBetaColor, borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "Follow",
                  style: TextStyle(
                      fontFamily: "STC",
                      fontSize: 15,
                      color: Color(0xFF11257e)),
                ),
              ),
              Icon(
                Icons.menu,
                size: 35,
              ),
              SizedBox(
                width: kMainPadding / 2,
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: kMainPadding, vertical: kMainPadding),
                decoration: BoxDecoration(
                    color: kOmgaColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(45),
                        bottomLeft: Radius.circular(45))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    color: kBetaColor, fontFamily: "STC"),
                                children: [
                                  TextSpan(
                                      text: "${controller.current_Tage.name}\n",
                                      style: TextStyle(fontSize: 25)),
                                  TextSpan(
                                      text:
                                          "${controller.current_Tage.description}",
                                      style: TextStyle(fontSize: 15))
                                ])),
                      ),
                      Container(
                        child: Text(
                          "${controller.current_Tage.tagePosts} Posts",
                          style: TextStyle(
                              fontFamily: "STC",
                              fontSize: 17.5,
                              color: kBetaColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: GridView.builder(
                // scrollDirection: Axis.horizontal,

                primary: false,
                padding: EdgeInsets.symmetric(
                    horizontal: kMainPadding, vertical: kMainPadding),

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: kMainPadding / 2,
                  mainAxisSpacing: kMainPadding / 2,
                  crossAxisCount: 3,
                ),
                itemCount: postController.GetPosts.length,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      postController.SetCurrentPost(
                          postController.GetPosts[index]);
                         
                      postDetailsScreen(
                          context, postController.GetPosts[index]);
                    },
                    child: Container(
                      child: Image(
                        image: NetworkImage(
                            postController.GetPosts[index].imageUrl ?? ""),
                      ),
            
                      decoration: BoxDecoration(
                        // boxShadow: kgetAlphaBoxShadow(),
                        border: Border.all(color: kAlphaColor),
                        borderRadius: BorderRadius.circular(25),
                        // color: kAlphaColor.withOpacity(0.2),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
