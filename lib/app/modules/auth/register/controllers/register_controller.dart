import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wtask/app/modules/widgets/err_dialog.dart';
import 'package:wtask/app/modules/widgets/loading_dialog.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;

FirebaseAuth firebaseAuth = FirebaseAuth.instance;

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
      Get.dialog(ErrorDialog(
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
          Get.dialog(LoadingDialog(message: "Registering Account"),
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
            authSignUp();
          });
        } else {
          Get.dialog(ErrorDialog(
            message: "Fill required fields",
          ));
        }
      } else {
        Get.dialog(ErrorDialog(
          message: "Password not matching",
        ));
      }
    }
  }

  void authSignUp() async {
    User? currentUser;
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailcontroller.text.trim(),
      password: passwordcontroller.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    });
  }
}
