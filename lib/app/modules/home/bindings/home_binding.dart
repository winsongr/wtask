import 'package:get/get.dart';
import 'package:wtask/app/modules/auth/auth/controllers/auth_controller.dart';
import 'package:wtask/app/modules/profile/controllers/profile_controller.dart';
import 'package:wtask/app/modules/project/controllers/project_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<ProjectController>(
      () => ProjectController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
