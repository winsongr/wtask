import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/auth/register/controllers/register_controller.dart';
import 'package:wtask/app/modules/profile/views/profile_view.dart';
import 'package:wtask/app/modules/project/views/project_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                title:
                    Text('Welcome'),
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.logout();
                      },
                      icon: const Icon(Icons.logout))
                ],
              ),
              body: IndexedStack(
                index: controller.tabIndex,
                children: [
                  ProjectView(),
                  ProfileView(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.book_fill), label: 'Project'),
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.profile_circled),
                      label: 'Profile')
                ],
              ),
            )));
  }
}
