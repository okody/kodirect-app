import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Screens/Posts/Functions/post_controller.dart';
import 'package:kodirect/Screens/Posts/Widgets/PostDetailsScreen/add_new_post.dart';
import 'package:kodirect/Screens/Providers/Functions/Models&Data.dart';
import 'package:kodirect/Screens/Providers/Widgets/MyAppBar.dart';
import 'package:kodirect/Screens/Providers/Widgets/my_drawer.dart';
import 'package:kodirect/UI/Constant.dart';
import 'Widgets/main_body.dart';
import 'Widgets/searchBarWidget.dart';
import 'package:image_picker/image_picker.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({Key? key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      init: Get.put(PostController()),
      builder: (controller) => Scaffold(
        endDrawer: Drawer_Slide(main_Mneu: MainMenu),
        body: Builder(builder: (context) {
          return Stack(
            children: [
              MyAppBar(
                menuClikced: (drawerStatus) {
                  setState(() {
                    Scaffold.of(context).openEndDrawer();
                  });
                },
              ),
              RefreshIndicator(
                onRefresh: () => controller.refresh_AllPosts(),
                child: Container(
                  margin: EdgeInsets.only(top: 120),
                  child: Column(
                    children: [searchBar(), mainBody(context)],
                  ),
                ),
              ),
            ],
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.getImage,
          backgroundColor: kAlphaColor,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future _getImage() async {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => AddNewPostScreen()),
    // );
  }
}
