import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: controller.isLoading.value
              ? const CircularProgressIndicator(
                  color: Colors.red,
                )
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.3,
                          child: Center(
                            child: controller.isImgLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.red,
                                  )
                                : CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 80,
                                    backgroundImage: NetworkImage(
                                      controller.userAvatarurl!,
                                    )),
                          ),
                        ),
                        ListTile(
                          title: const Text("Name"),
                          trailing: Text(controller.userName!),
                        ),
                        ListTile(
                          title: const Text("Email"),
                          trailing: Text(controller.userEmail!),
                        ),
                        ListTile(
                          title: const Text("Mobile Number"),
                          trailing: Text(controller.userPhone!),
                        ),
                        ListTile(
                          title: const Text("Address"),
                          trailing: Text(controller.userAddress!),
                        ),
                        ListTile(
                          title: const Text("City"),
                          trailing: Text(controller.userCity!),
                        ),
                        ListTile(
                          title: const Text("State"),
                          trailing: Text(controller.userState!),
                        ),
                        ListTile(
                          title: const Text("Country"),
                          trailing: Text(controller.userCountry!),
                        ),
                        ListTile(
                          title: const Text("Company Name"),
                          trailing: Text(controller.userCompany!),
                        ),
                        ListTile(
                          title: const Text("Occupation"),
                          trailing: Text(controller.userWork!),
                        ),
                        ListTile(
                          title: const Text("Years of Experience"),
                          trailing: Text(controller.userExp!),
                        ),
                      ],
                    ),
                ),
              )),
    );
  }
}
