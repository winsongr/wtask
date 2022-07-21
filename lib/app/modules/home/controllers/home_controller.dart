import 'package:get/get.dart';
import 'package:wtask/app/modules/auth/register/controllers/register_controller.dart';
import 'package:wtask/app/routes/app_pages.dart';

class HomeController extends GetxController {
  logout() {
    firebaseAuth.signOut().then((value) {
      Get.offAndToNamed(Routes.AUTH);
    });
  }

  var tabIndex = 0;
 void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
