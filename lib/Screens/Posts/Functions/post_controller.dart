import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Models/tage_model.dart';
import 'package:kodirect/Screens/Posts/Widgets/PostDetailsScreen/add_new_post.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Screens/Providers/Screens/Screens_Manager/home_screen.dart';
import 'package:kodirect/Services/API/Services/post_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class PostController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  final Post_SERVICES _post_services = Post_SERVICES();

  List<Post_MODEL>? _posts;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    refresh_AllPosts();
  }

  void showPosts() {
    // if (_response_info_Posts.success)
    //   _posts = List<Post_MODEL>.from(
    //       _response_info_Posts.toListModels(Post_MODEL()));
    // else {
    //   _posts = [];
    //   Get.snackbar("An Error occured", '${_response_info_Posts.message}',
    //       padding: EdgeInsets.only(bottom: kMainPadding * 2),
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: Duration(seconds: 3));
    // }
  }

// ========================================================= [Fetching] =========================================================
  Future<List<Post_MODEL>> _fetchPosts() async {
    _loading.value = true;
    Response_Model response_model = await _post_services.get_posts();

    _loading.value = false;
    if (response_model.success) {
      update();
      return List<Post_MODEL>.from(response_model.toListModels(Post_MODEL()));
    } else {
      Get.snackbar("An Error occured", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
      update();
      return [];
    }
  }

    Future<List<Post_MODEL>> _fetchPostByTage(String Tage) async {
    _loading.value = true;
    Response_Model response_model = await _post_services.get_posts(tage: Tage);

    _loading.value = false;
    if (response_model.success) {
      update();
      return List<Post_MODEL>.from(response_model.toListModels(Post_MODEL( )));
    } else {
      Get.snackbar("An Error occured", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
      update();
      return [];
    }
  }

  List<Post_MODEL> get GetPosts => _posts!;

  Future<void> refresh_AllPosts() async {
    _posts = await _fetchPosts();
    update();
  }

  Future<void> refresh_PostsByTage(String Tage) async {
    _posts = await _fetchPostByTage(Tage);
    update();
  }

  /// ===================================== [All post section] ======================================

  Post_MODEL? _currentPost;
  void SetCurrentPost(post_info) {
    _currentPost = post_info;
    update();
  }

  Post_MODEL? get currentPost => _currentPost;

  /// ===================================== [add post section] ======================================
  ///
  ///

  // File get image => File([_image!.path], "nothing");
  File? image;

  getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    // final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    XFile? _image = await _picker.pickImage(source: ImageSource.gallery);

    if (_image != null) {
      image = await ImageCropper.cropImage(
          sourcePath: _image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          androidUiSettings: AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: kAlphaColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          iosUiSettings: IOSUiSettings(
            minimumAspectRatio: 1.0,
          ));
    }
    if (image != null) Get.to(() => AddNewPostScreen());

    //  _getImage();
  }

  TextEditingController? Descrtion;
  TextEditingController? Title;

  Future<void> upload_post() async {
    LocalStroageController localStroageController =
       Get.find<LocalStroageController>();

    List<String> Tages = ["overwatch"];



    _loading.value = true;

    Response_Model response_model = await _post_services.create_post(Post_MODEL(
        poster: localStroageController.user_data,
        comment: " Descrtion!.text",
        title: "Title!.text",
        tages: Tages.map((tage) => Tage_MODEL(name: tage)).toList(),
        imageUrl: base64Encode(image!.readAsBytesSync()),
        format: p.extension(image!.path)));

    _loading.value = false;

    update();

    if (!response_model.success)
      Get.snackbar("Opss!!", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
    else {
      refresh_AllPosts();
      Get.off(() => HomeScreen());
    }
  }
}
