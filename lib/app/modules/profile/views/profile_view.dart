import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/auth/register/controllers/register_controller.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CircleAvatar(
          // backgroundImage:
              // NetworkImage(sharedPreferences!.getString("userAvatarurl")!),
        )
      ],
    ));
  }
}
  // 'userUid': currentUser.uid,
  //     'userEmail': currentUser.email,
  //     'userName': namecontroller.text.toString().trim(),
  //     'userAvatarurl': userprofile,
  //     'userPhone': phonecontroller.text.toString().trim(),
  //     'userAddress': addresscontroller.text.toString().trim(),
  //     'userCity': citycontroller.text.toString().trim(),
  //     'userState': statecontroller.text.toString().trim(),
  //     'userCountry': countrycontroller.text.toString().trim(),
  //     'userCompany': companycontroller.text.toString().trim(),
  //     'userWork': occupatiocontroller.text.toString().trim(),
  //     'userExp'