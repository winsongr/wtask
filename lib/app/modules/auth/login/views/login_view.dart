import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/widgets/cust_textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Image.asset('assets/auth.png'),
            width: Get.width * 0.6,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CusTextField(
                    TextInputType: TextInputType.emailAddress,
                    hintext: "Email",
                    data: Icons.email,
                    controller: controller.emailController,
                  ),
                  CusTextField(
                      hintext: "Password",
                      TextInputType: TextInputType.visiblePassword,
                      isObsecure: true,
                      data: Icons.password,
                      controller: controller.passwordController)
                ],
              )),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Login",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
        ],
      ),
    );
  }
}
