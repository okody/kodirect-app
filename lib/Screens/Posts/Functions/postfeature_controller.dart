import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/Post/comment_model.dart';
import 'package:kodirect/Models/post_model.dart';
import 'package:kodirect/Screens/Posts/Functions/post_controller.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Services/API/Services/postfeature_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';

class PostFeatureController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  PostController _postController = Get.find<PostController>();

  LocalStroageController localStroageController =
      Get.put(LocalStroageController());

  final PostFeature_SERVICES postFeature_SERVICES = PostFeature_SERVICES();

  List<Comment_MODEL>? _comments;

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    _comments = await fetchComments();
  }

  Future<void> refresh_Comments() async {
    _comments = await fetchComments();
  }

  Future<List<Comment_MODEL>> fetchComments() async {
    _loading.value = true;
    Response_Model response_model = await postFeature_SERVICES
        .get_comments(_postController.currentPost!.id!);
    _loading.value = false;
    if (response_model.success) {
      update();
      return List<Comment_MODEL>.from(
          response_model.toListModels(Comment_MODEL()));
    } else {
      Get.snackbar("An Error occured", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
      update();
      return [];
    }
  }

  List<Comment_MODEL> get GetComments => _comments!;

  /// ===================================== [All comment section] ======================================

  /// ===================================== [upload comment section] ======================================
  TextEditingController commentTextController = TextEditingController(text: "");

  Future<void> upload_comment() async {
    LocalStroageController localStroageController =
       Get.find<LocalStroageController>();

    _loading.value = true;
    Response_Model response_model = await postFeature_SERVICES.create_comment(
        Comment_MODEL(
            poster: localStroageController.user_data,
            content: commentTextController.text,
            postId: _postController.currentPost?.id));
    _loading.value = false;
    if (!response_model.success)
      Get.snackbar("Opss!!", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
    else {
      commentTextController.clear();

      Get.snackbar("${_postController.currentPost!.title!}", "تم نشر بنجاح",
          backgroundColor: Colors.greenAccent,
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3));
      refresh_Comments();
    }

    update();
  }

  bool if_user_like_post(List<Like_MODEL> likes) {
    LocalStroageController localStroageController =
        Get.find<LocalStroageController>();

    for (Like_MODEL like in likes)
      if (like.if_user_like_post(localStroageController.user_data!.id!))
        return true;

    return false;
  }

  Future<void> upload_like() async {
    LocalStroageController localStroageController =
        Get.find<LocalStroageController>();

    _loading.value = true;
    Response_Model response_model = await postFeature_SERVICES.create_like(
        Like_MODEL(
            userCode: localStroageController.user_data?.userID,
            postId: _postController.currentPost?.id));
    _loading.value = false;
    if (!response_model.success)
      Get.snackbar("Opss!!", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
    else
      Get.snackbar("${_postController.currentPost!.title!}", "تم نشر بنجاح",
          backgroundColor: Colors.greenAccent,
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 3));

    update();
  }

  Future<void> upload_view() async {
    LocalStroageController localStroageController =
       Get.find<LocalStroageController>();

    _loading.value = true;
    Response_Model response_model = await postFeature_SERVICES.create_view(
        View_MODEL(
            userCode: localStroageController.user_data?.userID,
            postId: _postController.currentPost?.id));
    _loading.value = false;
    if (!response_model.success)
      Get.snackbar("Opss!!", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));

    update();
  }
}
