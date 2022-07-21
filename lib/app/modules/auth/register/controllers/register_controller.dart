import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wtask/app/modules/widgets/err_dialog.dart';
import 'package:wtask/app/modules/widgets/loading_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;
import 'package:wtask/app/routes/app_pages.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
SharedPreferences? sharedPreferences;

class RegisterController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController companycontroller = TextEditingController();
  TextEditingController occupatiocontroller = TextEditingController();
  TextEditingController expcontroller = TextEditingController();

  var imagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  String userprofile = '';
  getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
    }
  }

  formValidate() async {
    if (imagePath.value.isEmpty) {
      Get.dialog(const ErrorDialog(
        message: "Select an image",
      ));
    } else {
      if (passwordcontroller.text == confirmPasswordcontroller.text) {
        if (namecontroller.text.isNotEmpty &&
            passwordcontroller.text.isNotEmpty &&
            confirmPasswordcontroller.text.isNotEmpty &&
            phonecontroller.text.isNotEmpty &&
            addresscontroller.text.isNotEmpty &&
            emailcontroller.text.isNotEmpty &&
            citycontroller.text.isNotEmpty &&
            statecontroller.text.isNotEmpty &&
            countrycontroller.text.isNotEmpty &&
            companycontroller.text.isNotEmpty &&
            occupatiocontroller.text.isNotEmpty &&
            expcontroller.text.isNotEmpty) {
          Get.dialog(const LoadingDialog(message: "Registering Account"),
              barrierDismissible: false);
          String filename = DateTime.now().microsecondsSinceEpoch.toString();
          fstorage.Reference reference = fstorage.FirebaseStorage.instance
              .ref()
              .child("users")
              .child(filename);
          fstorage.UploadTask uploadTask =
              reference.putFile(File(imagePath.value));
          fstorage.TaskSnapshot taskSnapshot =
              await uploadTask.whenComplete(() => {});
          await taskSnapshot.ref.getDownloadURL().then((url) {
            userprofile = url;
          });
          authSignUp();
        } else {
          Get.dialog(const ErrorDialog(
            message: "Fill required fields",
          ));
        }
      } else {
        Get.dialog(const ErrorDialog(
          message: "Password not matching",
        ));
      }
    }
  }

  void authSignUp() async {
    User? currentUser;
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailcontroller.text.toString().trim(),
      password: passwordcontroller.text.toString().trim(),
    )
        .then((auth) async {
      currentUser = auth.user;
    }).catchError((error) {
      Get.dialog(ErrorDialog(message: error.toString()));
    });
    if (currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) {
        Get.offAllNamed(Routes.HOME);
      });
    }
  }

  Future saveDataToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection("users").doc(currentUser.uid).set({
      'userUid': currentUser.uid,
      'userEmail': currentUser.email,
      'userName': namecontroller.text.toString().trim(),
      'userAvatarurl': userprofile,
      'userPhone': phonecontroller.text.toString().trim(),
      'userAddress': addresscontroller.text.toString().trim(),
      'userCity': citycontroller.text.toString().trim(),
      'userState': statecontroller.text.toString().trim(),
      'userCountry': countrycontroller.text.toString().trim(),
      'userCompany': companycontroller.text.toString().trim(),
      'userWork': occupatiocontroller.text.toString().trim(),
      'userExp': expcontroller.text.toString().trim()
    });
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString('userUid', currentUser.uid);
    await sharedPreferences!.setString(
      'userEmail',
      currentUser.email.toString(),
    );
    await sharedPreferences!.setString(
      'userName',
      namecontroller.text.toString().trim(),
    );
    await sharedPreferences!.setString(
      'userAvatarurl',
      userprofile,
    );
    await sharedPreferences!.setString(
      'userPhone',
      phonecontroller.text.toString().trim(),
    );
    await sharedPreferences!.setString(
      'userAddress',
      addresscontroller.text.toString().trim(),
    );
    await sharedPreferences!.setString(
      'userCity',
      citycontroller.text.toString().trim(),
    );
    await sharedPreferences!.setString(
      'userState',
      statecontroller.text.toString().trim(),
    );
    await sharedPreferences!.setString(
      'userCountry',
      countrycontroller.text.toString().trim(),
    );
    await sharedPreferences!.setString(
      'userCompany',
      companycontroller.text.toString().trim(),
    );
    await sharedPreferences!.setString(
      'userWork',
      occupatiocontroller.text.toString().trim(),
    );
    await sharedPreferences!
        .setString('userExp', expcontroller.text.toString().trim());
  }
}
