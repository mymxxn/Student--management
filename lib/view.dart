// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_management/controller/controller.dart';
import 'package:student_management/mj/model/model.dart';
import 'package:student_management/search.dart';

import 'edit.dart';

class View extends StatelessWidget {
  View({Key? key, required this.student, required this.index})
      : super(key: key);
  Box<Model> box = Hive.box<Model>('records');
  Model student;
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<StudentController>(builder: (controller) {
        return ListView(
          children: [
            ListTile(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                    // student.save();
                    // controller.update();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey[800],
                  )),
              title: Text(
                student.name!,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              tileColor: Color.fromRGBO(255, 197, 181, 100),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: Image.file(File(student.imagePath)).image,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 30, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Name:",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22)),
                      Text(student.name!,
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Age:",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22)),
                      Text(student.age.toString(),
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Domain:",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22)),
                      Text(student.domain.toString(),
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Phone No.:",
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22)),
                      Text(student.phone.toString(),
                          style:
                              TextStyle(color: Colors.grey[800], fontSize: 22))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => edit(
                  //         student: student,
                  //         index: index,
                  //       ),
                  //     ));
                  Get.to(() => edit(
                        student: student,
                        index: index,
                      ));
                },
                child: Text(
                  "Edit",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color.fromRGBO(255, 174, 165, 100),
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: ElevatedButton(
                onPressed: () async {
                  await box.deleteAt(index);
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Search(),
                      ));
                  controller.update();
                },
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Color.fromRGBO(255, 174, 165, 100),
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ],
        );
      }),
    );
  }
}
