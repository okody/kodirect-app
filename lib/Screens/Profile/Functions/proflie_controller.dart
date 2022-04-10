import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Screens/Profile/Widgets/PorflieFavoritePageWidget.dart';
import 'package:kodirect/Screens/Profile/Widgets/profilePostPageWidget.dart';
import 'package:kodirect/Screens/Profile/Widgets/profile_info_page.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Services/API/Services/post_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';

class ProflieController extends GetxController {
  List<Post_MODEL>? _userPosts;
  List<Post_MODEL> get userPosts => _userPosts!;

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  final Post_SERVICES _post_services = Post_SERVICES();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
     
   options = [
      {"index": 0, "Label": "My Info", "Widget": profileInfoPageWidget()},
      {"index": 1, "Label": "Posts", "Widget": profilePostPageWidget()},
      {"index": 2, "Label": "Favorite", "Widget": profileFavoritePageWidget()},
      {"index": 3, "Label": "Followers", "Widget": Container()},
    ];
    selectedPage = options![0]["Widget"];
  }

    @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

  
  }
  

  Future<void> refresh_userPosts() async {
    _userPosts = await _featchUserPosts();
  }

  Future<List<Post_MODEL>> _featchUserPosts() async {
    LocalStroageController localStroageController =
        Get.find<LocalStroageController>();

    _loading.value = true;
    Response_Model response_model = await _post_services.get_posts(
        user_id: localStroageController.user_data!.userID);

    _loading.value = false;
    // if (response_model.success) {
    //   update();
    //   return List<Post_MODEL>.from(response_model.toListModels(Post_MODEL()));
    // } else
    {
      Get.snackbar("An Error occured", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
      update();
      return [];
    }
  }

  /// ================================ [Data] ===============================
  var selectedPage;
  List<Map>? options ;
}
