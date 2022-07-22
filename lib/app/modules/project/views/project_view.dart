import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wtask/app/modules/widgets/progress_bar.dart';

import '../controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
          StreamBuilder(
            stream: controller.allProjects,
            builder: (context, snapShots) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return projectCard();
                },
              );
            },
          )
        ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.openaddProject();
          },
          child: Icon(CupertinoIcons.add),
          tooltip: "Add Project",
        ),
      ),
    );
  }

  Widget projectCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text("Project Name:"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Description"), Text("")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Category"), Text("APP Development")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Start Date"), Text("22/072022")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("End Dates"), Text("25/07/2022")],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Notes"),
                      Text("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
