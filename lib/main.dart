import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    GetMaterialApp(
        title: "WTask",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.amber.shade300,
          primarySwatch: Colors.amber,
        )),
  );
}
