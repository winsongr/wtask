import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtask/app/modules/widgets/cust_textfield.dart';
import 'package:wtask/app/modules/widgets/err_dialog.dart';
import 'package:wtask/app/modules/widgets/loading_dialog.dart';
import 'package:wtask/app/routes/app_pages.dart';

class ProjectController extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentSnapshot? doc;
  var allProjects;
  TextEditingController proController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController cateController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  late String pId;
  String? proName;
  String? descRip;
  String? cateGory;
  String? startDate;
  String? endDate;
  String? noteS;
  @override
  void onInit() async {
    super.onInit();
    print("init");
    await getAllProjects();
    print("initend");
  }

  openaddProject() {
    Get.toNamed(Routes.ADDPROJECT);
  }

  String uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  formValidate() async {
    if (proController.text.isNotEmpty &&
        desController.text.isNotEmpty &&
        cateController.text.isNotEmpty &&
        startController.text.isNotEmpty &&
        endController.text.isNotEmpty &&
        noteController.text.isNotEmpty) {
      addProjectToFirebase(user!);
      Get.dialog(const LoadingDialog(message: "Adding Project"),
          barrierDismissible: false);
    } else {
      Get.dialog(const ErrorDialog(
        message: "Fill required fields",
      ));
    }
  }

  Future addProjectToFirebase(User user) async {
    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('projects');

    await ref.doc(uniqueIdName).set({
      "pid": uniqueIdName,
      "projectName": proController.text.toString(),
      "desc": desController.text.toString(),
      "cate": cateController.text.toString(),
      "start": startController.text.toString(),
      "end": endController.text.toString(),
      "note": noteController.text.toString(),
    });

    clearForm();

    Get.dialog(AlertDialog(
      content: const Text("Success"),
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(Routes.HOME);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          child: const Center(
            child: Text("OK"),
          ),
        )
      ],
    ));
  }

  clearForm() {
    proController.text = '';
    desController.text = '';
    cateController.text = '';
    startController.text = '';
    endController.text = '';
    noteController.text = '';
    uniqueIdName = DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future getAllProjects() async {
    allProjects = await users.doc(user?.uid).collection('projects').snapshots();
    pId = doc?['pid'];
    proName = doc?["projectName"];
    descRip = doc?["desc"];
    cateGory = doc?["cate"];
    startDate = doc?["start"];
    endDate = doc?["end"];
    noteS = doc?["note"];
    print(allProjects!.docs.length);
    print(pId);
  }
}
