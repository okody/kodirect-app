import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/user_model.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Screens/Providers/Widgets/MyAppBar.dart';
import 'package:kodirect/Screens/Providers/Widgets/my_drawer.dart';
import 'package:kodirect/Screens/Splash/splash_screen.dart';
import 'package:kodirect/Services/API/Services/post_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:provider/provider.dart';

import 'Functions/Data&Models.dart';
import 'Functions/proflie_controller.dart';
import 'Widgets/user_profile_page.dart';
import 'Widgets/PorflieFavoritePageWidget.dart';
import 'Widgets/profile_info_page.dart';
import 'Widgets/profilePostPageWidget.dart';

class ProfileScreen extends StatelessWidget {
  // User_MODEL appUser = User_MODEL();

  @override
  Widget build(BuildContext context) {
    ProflieController controller = Get.find<ProflieController>();

    return Scaffold(
      drawer: Drawer_Slide(main_Mneu: MainMenu),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          MyAppBar(
            height: 250,
            menuClikced: (drawerStatus) {
              print("test");
              // setState(() {
              //   Scaffold.of(context).openEndDrawer();
              // });
            },
          ),
          Positioned(
            top: 125,
            child: Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.symmetric(vertical: kMainPadding * 5),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.5),
                    color: Colors.white,
                    shape: BoxShape.circle),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 280),
            child: MyProfileSwitcher(
              options: controller.options!,
              onChange: (page) {},
            ),
          )
        ],
      ),
    );
  }
}
