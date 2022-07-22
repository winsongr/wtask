import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final User? user = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DocumentSnapshot? doc;
  String? userEmail;
  String? userName;
  String? userAvatarurl;
  String? userPhone;
  String? userAddress;
  String? userCity;
  String? userState;
  String? userCountry;
  String? userCompany;
  String? userWork;
  String? userExp;
  String? userUid;
  RxBool isLoading = false.obs;
  RxBool isImgLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getUserData();
    await startTimer();
  }

  Future getUserData() async {
    isLoading(true);
    doc = await users.doc(user?.uid).get();
    userName = doc?['userName'];
    userEmail = doc?['userEmail'];
    userAvatarurl = doc?['userAvatarurl'];
    userPhone = doc?['userPhone'];
    userAddress = doc?['userAddress'];
    userCity = doc?['userCity'];
    userState = doc?['userState'];
    userCountry = doc?['userCountry'];
    userCompany = doc?['userCompany'];
    userWork = doc?['userWork'];
    userExp = doc?['userExp'];
    userUid = doc?['userUid'];
    isLoading(false);
  }

  Future startTimer() async {
    Timer(const Duration(seconds: 2), () {
      isImgLoading(false);
    });
  }
}
