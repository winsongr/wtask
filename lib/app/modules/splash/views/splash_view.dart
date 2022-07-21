
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) async => await controller.startTimer());
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img.png',
                width: Get.width * 0.5,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  'W Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54, fontSize: 40, letterSpacing: 3),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}