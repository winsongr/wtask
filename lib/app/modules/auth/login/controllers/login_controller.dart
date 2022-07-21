import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wtask/app/modules/auth/register/controllers/register_controller.dart';
import 'package:wtask/app/modules/widgets/err_dialog.dart';
import 'package:wtask/app/modules/widgets/loading_dialog.dart';
import 'package:wtask/app/routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  formValidate() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      login();
    } else {
      Get.dialog(const ErrorDialog(
        message: "Please enter email & password",
      ));
    }
  }

  login() async {
    Get.dialog(const LoadingDialog(
      message: "checking credentials",
    ));
    User? currentUser;
    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text.trim().toString(),
            password: passwordController.text.trim().toString())
        .then((auth) => currentUser = auth.user!)
        .catchError((error) {
      Get.dialog(
        ErrorDialog(
          message: error.message.toString(),
        ),
      );
    });
    if (currentUser != null) {
      readSetDataLocal(currentUser!);
    }
  }

  Future readSetDataLocal(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        // await sharedPreferences!.setString('uid', currentUser.uid);
        // await sharedPreferences!
        //     .setString('userEmail', snapshot.data()!['userEmail']);
        // await sharedPreferences!
        //     .setString('userName', snapshot.data()!['userName']);
        // await sharedPreferences!
        //     .setString('userAvatarurl', snapshot.data()!['userAvatarurl']);
        // await sharedPreferences!
        //     .setString('userPhone', snapshot.data()!['userPhone']);
        // await sharedPreferences!
        //     .setString('userAddress', snapshot.data()!['userAddress']);
        // await sharedPreferences!
        //     .setString('userCity', snapshot.data()!['userCity']);
        // await sharedPreferences!
        //     .setString('userState', snapshot.data()!['userState']);
        // await sharedPreferences!
        //     .setString('userCountry', snapshot.data()!['userCountry']);
        // await sharedPreferences!
        //     .setString('userCompany', snapshot.data()!['userCompany']);
        // await sharedPreferences!
        //     .setString('userWork', snapshot.data()!['userWork']);
        // await sharedPreferences!
        //     .setString('userExp', snapshot.data()!['userExp']);

        Get.off(Routes.HOME);
      } else {
        firebaseAuth.signOut();
        Get.off(Routes.AUTH);
        Get.dialog(const ErrorDialog(
          message: "No record found!",
        ));
      }
    });
  }
}
