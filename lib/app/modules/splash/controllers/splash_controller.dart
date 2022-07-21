import 'dart:async';

import 'package:get/get.dart';
import 'package:wtask/app/routes/app_pages.dart';

class SplashController extends GetxController {
  Future<void> startTimer() async {
    Timer(Duration(seconds: 1), () {
      // if (FirebaseAuth.currentUser != null) {
      Get.offAndToNamed(Routes.HOME); // } else {
      //   Get.to(authscreen)
      // }
    });
  }
}
