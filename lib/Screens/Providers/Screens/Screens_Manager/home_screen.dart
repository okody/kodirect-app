import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Providers/Functions/Alert_Dilog.dart';
import 'package:kodirect/Screens/Providers/Screens/Screens_Manager/screen_controller.dart';
import 'package:kodirect/Screens/Providers/Widgets/Alert_Dilog.dart';
import 'package:kodirect/Screens/Providers/Widgets/NavBar.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          alert(context, exitApp_Alert);
          return false;
        },
        child: GetBuilder<ScreenController>(
            init: Get.put(ScreenController()),
            builder: (controller) {
              return Scaffold(
                body: controller.CurrentScreen.screen,
                bottomNavigationBar: NavBar(
                  screens: controller.Screens,
                  onTap: controller.onBottomBarScreenPicked,
                ),
                // bottomNavigationBar: CurvedNavigationBar(),
              );
            }),
      ),
    );
  }
}
