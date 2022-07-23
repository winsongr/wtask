 import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wtask/app/routes/app_pages.dart';

class SplashController extends GetxController {
  Future<void> startTimer() async {
    Timer(const Duration(seconds: 1), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.offAllNamed(Routes.AUTH);
      }
    });
  }
}