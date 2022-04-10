import 'package:get/get.dart';
import 'package:kodirect/Screens/Auth/Functions/auth_controller.dart';
import 'package:kodirect/Screens/Profile/Functions/proflie_controller.dart';
import 'package:kodirect/Screens/Providers/Functions/local_storage.dart';
import 'package:kodirect/Screens/Providers/Screens/Screens_Manager/screen_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ScreenController());
    Get.lazyPut(() => LocalStroageController());

  }
}
