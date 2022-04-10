import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Screens/Posts/Functions/post_controller.dart';
import 'package:kodirect/Screens/Posts/Functions/tage_controller.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/Services/API/Services/post_services.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:provider/provider.dart';
import 'PostDetailsScreen/post_details_screen.dart';
import 'tage_details_screen.dart';

Expanded mainBody(BuildContext context) {
  return Expanded(
    child: SingleChildScrollView(
      padding: EdgeInsets.only(bottom: kMainPadding / 2),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // ==>

          // Most Popluer div
          // for (int i = 0; i <= 3; i++)
          Category(),

          // Most Popluer div
          Container(
            margin: EdgeInsets.only(bottom: kMainPadding),
            child: Column(
              children: [
                // ==> Labels
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kMainPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tages",
                        style: TextStyle(
                            fontFamily: "STC",
                            fontSize: 17.5,
                            color: kAlphaColor,
                            fontWeight: FontWeight.w400),
                      ),
                      InkWell(
                        onTap: () async {},
                        child: Text(
                          "See All",
                          style: TextStyle(
                              fontFamily: "STC",
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: kTextFieldColor,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                GetBuilder<TageController>(
                  init: Get.put(TageController()),
                  builder: (controller) => Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: SizedBox(
                      height: 50,
                      child: controller.loading.value
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView(
                              scrollDirection: Axis.horizontal,
                              children: controller.tages
                                  .map((tage) => GestureDetector(
                                        onTap: () async {
                                          Get.find<PostController>()
                                              .refresh_PostsByTage(tage.name!);
                                          controller.setCurrentTage(tage);
                                          Get.to(() => TageDetailsScreen());
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: kMainPadding / 2),
                                          width: 130,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color:
                                                  kAlphaColor.withOpacity(0.2)),
                                          child: Center(
                                            child: Text(
                                              "${tage.name}",
                                              style: TextStyle(
                                                  fontFamily: "STC",
                                                  fontSize: 20,
                                                  color: kAlphaColor,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList()),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // posts = List<Post_MODEL>.from(response_Model.data
    //     .map((data) => Post_MODEL.fromJson(data))
    //     .toList());

    return GetBuilder<PostController>(
        init: PostController(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.only(bottom: kMainPadding),
            child: controller.loading.value
                ? Center(
                    child: CircularProgressIndicator(
                    color: kAlphaColor,
                  ))
                : Column(
                    children: [
                      // ==> Labels

                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: kMainPadding / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Most Recent",
                              style: TextStyle(
                                  fontFamily: "STC",
                                  fontSize: 17.5,
                                  color: kAlphaColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () {
                                // print(response_Model.message);
                                // // Navigator.push(
                                // //   context,
                                // //   MaterialPageRoute(builder: (context) => DetailsScreen()),
                                // // );
                              },
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic,
                                    color: kTextFieldColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: SizedBox(
                            height: 150,
                            // width: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.GetPosts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      controller.SetCurrentPost(
                                          controller.GetPosts[index]);
                                      postDetailsScreen(
                                          context, controller.GetPosts[index]);
                                    },
                                    child: Container(
                                      child: Image(
                                        image: NetworkImage(controller
                                                .GetPosts[index].imageUrl ??
                                            ""),
                                      ),
                                      margin: EdgeInsets.only(
                                          right: kMainPadding / 2),
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        // boxShadow: kgetAlphaBoxShadow(),
                                        border: Border.all(color: kAlphaColor),
                                        borderRadius: BorderRadius.circular(25),
                                        // color: kAlphaColor.withOpacity(0.2),
                                      ),
                                    ),
                                  );
                                })),
                      )
                    ],
                  ),
          );
        });
  }
}
