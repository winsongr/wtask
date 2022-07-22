import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wtask/app/modules/project/controllers/project_controller.dart';
import 'package:wtask/app/modules/widgets/cust_textfield.dart';

class AddProject extends GetView<ProjectController> {
  AddProject({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Project'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Form(
              key: _formKey,
              child: Column(children: [
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Project Name",
                  data: Icons.bookmark_add_rounded,
                  controller: controller.proController,
                ),
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Description",
                  data: Icons.description,
                  controller: controller.desController,
                ),
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Category",
                  data: Icons.category,
                  controller: controller.cateController,
                ),
                CusTextField(
                  TextInputType: TextInputType.datetime,
                  hintext: "Start Date",
                  data: Icons.date_range_outlined,
                  controller: controller.startController,
                ),
                CusTextField(
                  TextInputType: TextInputType.datetime,
                  hintext: "End Dates",
                  data: Icons.date_range,
                  controller: controller.endController,
                ),
                CusTextField(
                  TextInputType: TextInputType.text,
                  hintext: "Notes",
                  data: Icons.note,
                  controller: controller.noteController,
                ),
              ])),
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
            child: const Text(
              "Add Project",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ])));
  }
}