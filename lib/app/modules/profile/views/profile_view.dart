import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;

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
                        listTile(tstyle,
                            txt: "Name",
                            trailTxt: controller.userName!.toUpperCase()),
                        listTile(
                          tstyle,
                          txt: "Email",
                          trailTxt: controller.userEmail!,
                        ),
                        listTile(tstyle,
                            txt: "Mobile Number",
                            trailTxt: controller.userPhone!),
                        listTile(
                          tstyle,
                          txt: "Address",
                          trailTxt: controller.userAddress!,
                        ),
                        listTile(
                          tstyle,
                          txt: "City",
                          trailTxt: controller.userCity!,
                        ),
                        listTile(
                          tstyle,
                          txt: "State",
                          trailTxt: controller.userState!,
                        ),
                        listTile(
                          tstyle,
                          txt: "Country",
                          trailTxt: controller.userCountry!,
                        ),
                        listTile(tstyle,
                            txt: "Company Name",
                            trailTxt: controller.userCompany!),
                        listTile(
                          tstyle,
                          txt: "Occupation",
                          trailTxt: controller.userWork!,
                        ),
                        listTile(
                          tstyle,
                          txt: "Years of Experience",
                          trailTxt: controller.userExp!,
                        ),
                        SizedBox(height: 15,)
                      ],
                    ),
                  ),
                )),
    );
  }

  ListTile listTile(TextTheme tstyle,
      {required String txt, required trailTxt}) {
    return ListTile(
      title: Text(
        txt,
        style: tstyle.titleMedium!,
        textScaleFactor: Get.textScaleFactor,
      ),
      trailing: Text(trailTxt),
    );
  }
}
