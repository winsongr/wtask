import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtask/app/modules/project/controllers/project_controller.dart';

class ProjectView extends GetView<ProjectController> {
  const ProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var tstyle = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(controller.user!.uid)
              .collection('projects')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    "No Projects Found \n Add Projects",
                    style: tstyle.titleLarge!.copyWith(color: Colors.grey),
                    textScaleFactor: Get.textScaleFactor,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return projectCard(
                      proName: snapshot.data!.docs[index]['projectName'],
                      descRip: snapshot.data!.docs[index]['desc'],
                      cateGory: snapshot.data!.docs[index]['cate'],
                      startDate: snapshot.data!.docs[index]['start'],
                      endDate: snapshot.data!.docs[index]['end'],
                      noteS: snapshot.data!.docs[index]['note'],
                      tstyle: tstyle);
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.openaddProject();
          },elevation: 10.0,
          tooltip: "Add Project",splashColor: Colors.orange,
          child: const Icon(CupertinoIcons.add,color: Colors.white,),
        ),
      ),
    );
  }

  Widget projectCard(
      {required String proName,
      required String descRip,
      required String cateGory,
      required String startDate,
      required String endDate,
      required String noteS,
      required TextTheme tstyle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Project Name",
                          textScaleFactor: Get.textScaleFactor,
                          style: tstyle.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold)),
                      Text(proName.toUpperCase(),
                          textScaleFactor: Get.textScaleFactor,
                          style: tstyle.titleMedium!),
                    ],
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Description",
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.titleMedium!,),
                        Flexible(flex: 1,
                          child: Text(descRip,
                              textScaleFactor: Get.textScaleFactor,
                              style: tstyle.bodyMedium!),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Category",
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.titleMedium!),
                        Text(cateGory,
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.bodyMedium!)
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Start Date",
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.titleMedium!),
                        Text(startDate,
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.bodyMedium!)
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("End Dates",
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.titleMedium!),
                        Text(endDate,
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.bodyMedium!)
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Notes",
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.titleMedium!),
                        Text(noteS,
                            textScaleFactor: Get.textScaleFactor,
                            style: tstyle.bodyMedium!)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
