import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/widgets/cust_textfield.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: Get.width * 0.6,
            child: Image.asset('assets/auth.png'),
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
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              controller.formValidate();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            child: Text(
              "Login",
              style: tstyle.button!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              textScaleFactor: Get.textScaleFactor,
            ),
          ),
        ],
      ),
    );
  }
}
