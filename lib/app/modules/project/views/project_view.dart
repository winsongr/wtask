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
                    style: tstyle.titleMedium!.copyWith(fontSize: 20),
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
                  );
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
          },
          tooltip: "Add Project",
          child: const Icon(CupertinoIcons.add),
        ),
      ),
    );
  }

  Widget projectCard({
    required String proName,
    required String descRip,
    required String cateGory,
    required String startDate,
    required String endDate,
    required String noteS,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Project Name"), Text(proName)],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Description"), Text(descRip)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Category"), Text(cateGory)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Start Date"), Text(startDate)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("End Dates"), Text(endDate)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Notes"), Text(noteS)],
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
