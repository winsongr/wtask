import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/widgets/cust_textfield.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () async {
                controller.imagePath.value = '';
                controller.getImage();
              },
              child: Obx(
                () => CircleAvatar(
                  radius: Get.width * 0.30,
                  backgroundColor: Colors.white,
                  backgroundImage: controller.imagePath.isEmpty
                      ? null
                      : FileImage(File(controller.imagePath.value)),
                  child: controller.imagePath.isEmpty
                      ? Icon(
                          Icons.add_photo_alternate,
                          size: Get.width * 0.30,
                          color: Colors.grey,
                        )
                      : null,
                ),
              )),
          SizedBox(height: 10),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CusTextField(
                    TextInputType: TextInputType.name,
                    hintext: "Name",
                    data: Icons.person,
                    controller: controller.namecontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.emailAddress,
                    hintext: "Email",
                    data: Icons.email,
                    controller: controller.emailcontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.phone,
                    hintext: "Mobile number",
                    data: Icons.phone,
                    controller: controller.phonecontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.streetAddress,
                    hintext: "Address",
                    data: Icons.home,
                    controller: controller.addresscontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.streetAddress,
                    hintext: "City",
                    data: Icons.location_city,
                    controller: controller.citycontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.streetAddress,
                    hintext: "State",
                    data: Icons.map,
                    controller: controller.statecontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.streetAddress,
                    hintext: "Country",
                    data: Icons.place,
                    controller: controller.countrycontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.text,
                    hintext: "Company Name",
                    data: Icons.factory_rounded,
                    controller: controller.companycontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.text,
                    hintext: "Occupation",
                    data: Icons.work,
                    controller: controller.occupatiocontroller,
                  ),
                  CusTextField(
                    TextInputType: TextInputType.number,
                    hintext: "Years of Experience",
                    data: Icons.calendar_month,
                    controller: controller.expcontroller,
                  ),
                  CusTextField(
                      hintext: "Password",
                      TextInputType: TextInputType.visiblePassword,
                      isObsecure: true,
                      data: Icons.password,
                      controller: controller.passwordcontroller),
                  CusTextField(
                      hintext: "Confirm Password",
                      TextInputType: TextInputType.visiblePassword,
                      isObsecure: true,
                      data: Icons.password,
                      controller: controller.confirmPasswordcontroller)
                ],
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              controller.formValidate();
            },
            child: Text(
              "Sign Up",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
