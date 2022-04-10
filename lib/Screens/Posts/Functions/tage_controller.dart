import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodirect/Models/tage_model.dart';
import 'package:kodirect/Services/API/Services/tag_services.dart';
import 'package:kodirect/Services/API/api_info.dart';
import 'package:kodirect/UI/Constant.dart';

class TageController extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  Tage_SERVICES _tage_services = Tage_SERVICES();

  List<Tage_MODEL>? _tages;
  List<Tage_MODEL> get tages => _tages!;
  Tage_MODEL get current_Tage => _currentTage!;
  Tage_MODEL? _currentTage;

  void setCurrentTage(tage) {
    _currentTage = tage;
  }

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    _tages = await fetchTages();
  }

  Future<void> refresh_Tages() async {
    _tages = await fetchTages();
  }

  Future<List<Tage_MODEL>> fetchTages() async {
    _loading.value = true;
    Response_Model response_model = await _tage_services.get_tags();
    _loading.value = false;
    if (response_model.success) {
      update();
      return List<Tage_MODEL>.from(response_model.toListModels(Tage_MODEL()));
    } else {
      Get.snackbar("An Error occured", '${response_model.message}',
          padding: EdgeInsets.only(bottom: kMainPadding * 2),
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3));
      update();
      return [];
    }
  }
}
