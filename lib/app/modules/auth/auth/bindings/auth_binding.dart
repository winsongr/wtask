import 'package:get/get.dart';
import 'package:wtask/app/modules/auth/login/controllers/login_controller.dart';
import 'package:wtask/app/modules/auth/register/controllers/register_controller.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
