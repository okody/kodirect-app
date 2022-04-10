import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Profile/Functions/proflie_controller.dart';
import 'package:kodirect/Screens/Profile/proflie_screen.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:provider/provider.dart';

// Container profileInfoPageWidget(
//     User_MODEL user_data, List<Post_MODEL> user_Posts) {
//   return ;
// }

class profileInfoPageWidget extends StatelessWidget {
  const profileInfoPageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalStroageController>(
      init: Get.find<LocalStroageController>(),
      builder: (controller) => Container(
        child: controller.loading.value
            ? Center(
                child: CircularProgressIndicator(
                color: kAlphaColor,
              ))
            : Container(
                padding: EdgeInsets.only(
                    top: kMainPadding, left: kMainPadding, right: kMainPadding),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(kMainPadding / 4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.person,
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(
                            width: kMainPadding,
                          ),
                          Text("${controller.user_data?.name}",
                              style: TextStyle(
                                fontFamily: "STC",
                                fontSize: 20,
                                color: Colors.grey[500],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: kMainPadding,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(kMainPadding / 4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.email,
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(
                            width: kMainPadding,
                          ),
                          Text("${controller.user_data?.email}",
                              style: TextStyle(
                                fontFamily: "STC",
                                fontSize: 20,
                                color: Colors.grey[500],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: kMainPadding,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(kMainPadding / 4),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.grey)),
                            child: Icon(
                              Icons.date_range,
                              color: Colors.grey[400],
                            ),
                          ),
                          SizedBox(
                            width: kMainPadding,
                          ),
                          Text("${controller.user_data?.doj}",
                              style: TextStyle(
                                fontFamily: "STC",
                                fontSize: 20,
                                color: Colors.grey[500],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: kMainPadding,
                      ),
                      Divider(
                        color: Colors.black,
                        // thickness: 1.5,
                      ),
                      Row(
                        children: [
                          // Posts Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.image,
                                size: 30,
                                color: kAlphaColor,
                              ),
                              SizedBox(
                                width: kMainPadding / 5,
                              ),
                              Text("Posts: ",
                                  style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 15,
                                    color: kAlphaColor,
                                  ))
                            ],
                          ),
                          SizedBox(
                            width: kMainPadding / 2,
                          ),

                          // Views Row
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                size: 30,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: kMainPadding / 5,
                              ),
                              Text("Views: 55.3M",
                                  style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 15,
                                    color: Colors.blue,
                                  ))
                            ],
                          ),
                          // Likes Row
                          SizedBox(
                            width: kMainPadding / 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 30,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: kMainPadding / 5,
                              ),
                              Text("Likes: 33.3B",
                                  style: TextStyle(
                                    fontFamily: "STC",
                                    fontSize: 15,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kMainPadding,
                      ),
                      GetBuilder<AuthController>(
                        init: Get.find<AuthController>(),
                        builder: (controller) => GestureDetector(
                          onTap: () => controller.sginOut(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: kMainPadding,
                                vertical: kMainPadding / 2),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kAlphaColor, width: 1.5)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: kOmgaColor,
                                ),
                                SizedBox(
                                  width: kMainPadding / 2,
                                ),
                                Text("Get out",
                                    style: TextStyle(
                                      fontFamily: "STC",
                                      fontSize: 18,
                                      color: kOmgaColor,
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
