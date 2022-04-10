import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Posts/Functions/post_controller.dart';
import 'package:kodirect/Screens/Profile/Functions/proflie_controller.dart';
import 'package:kodirect/UI/Constant.dart';


class profilePostPageWidget extends StatelessWidget {
  // const profilePostPageWidget({
  //   Key? key,
   
  // }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
  final ProflieController proflieController = Get.find<ProflieController>();
    return GridView.builder(
      // scrollDirection: Axis.horizontal,

      primary: false,
      padding:
          EdgeInsets.symmetric(horizontal: kMainPadding, vertical: kMainPadding),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: kMainPadding / 2,
        mainAxisSpacing: kMainPadding / 2,
        crossAxisCount: 3,
      ),
      itemCount: proflieController.userPosts.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // postController.SetCurrentPost(postController.GetPosts[index]);

            // postDetailsScreen(context, postController.GetPosts[index]);
          },
          child: Container(
            child: Image(
              image:
                  NetworkImage(proflieController.userPosts[index].imageUrl ?? ""),
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
    );
  }
}
