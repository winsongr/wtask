import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/profile/views/profile_view.dart';
import 'package:wtask/app/modules/project/views/project_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('W Task'),
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
                children: const [
                  ProjectView(),
                  ProfileView(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                items: const [
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
