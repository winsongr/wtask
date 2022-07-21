import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/auth/login/views/login_view.dart';
import 'package:wtask/app/modules/auth/register/views/register_view.dart';
import 'package:wtask/app/routes/app_pages.dart';

import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.amber.shade300.withOpacity(0.9),
        appBar: AppBar(
          toolbarHeight: 40,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'W Task',
            ),
          ),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(
              child: Row(mainAxisSize: MainAxisSize.min, children: const [
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Login",
                )
              ]),
            ),
            Tab(
              child: Row(mainAxisSize: MainAxisSize.min, children: const [
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Register",
                )
              ]),
            )
          ]),
        ),
        body: SizedBox(
            child: TabBarView(
          children: [LoginView(), RegisterView()],
        )),
      ),
    );
  }
}
