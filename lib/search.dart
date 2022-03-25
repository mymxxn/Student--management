import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_management/add.dart';
import 'package:student_management/controller/controller.dart';
import 'package:student_management/mj/model/model.dart';
import 'package:student_management/view.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);

  String searchText = "";

  Box<Model> box = Hive.box<Model>('records');

  @override
  Widget build(BuildContext context) {
    final studentController = Get.find<StudentController>();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Add(),
            //     ));
             Get.to(() => Add());
          },
          child: const Icon(
            Icons.add,
            size: 45,
          ),
          foregroundColor: Color.fromRGBO(255, 150, 138, 100),
          backgroundColor: Colors.grey[700],
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Color.fromRGBO(255, 150, 138, 100),
          title: Text(
            "Students",
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            GetBuilder<StudentController>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(50, 40, 50, 0),
                  child: TextFormField(
                    autofocus: false,
                    style: const TextStyle(fontSize: 19.0, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Search Student",
                      contentPadding:
                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                    onChanged: (value) {
                      searchText = value;
                      studentController.update();
                    },
                  ),
                );
              }
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
               child: GetBuilder<StudentController>(
                builder: (controller) {
              // child: ValueListenableBuilder(
              //   valueListenable: Hive.box<Model>('records').listenable(),
              //   builder: (context, Box<Model> box, _) {
              //     List<Model> students = box.values.toList();
              //     if (box.values.isEmpty) {
              //       return const Center(
              //         child: Text(
              //           'No data!',
              //           style: TextStyle(color: Colors.black, fontSize: 22),
              //         ),
              //       );
              //     }
              //     List<Model> result = students
              //         .where((element) => element.name!
              //             .toLowerCase()
              //             .contains(searchText.toLowerCase()))
              //         .toList();
                  List<Model> results = searchText.isEmpty
                      ? controller.box.values.toList()
                      : controller.box.values
                          .where((element) => element.name!
                              .toLowerCase()
                              .contains(searchText.toLowerCase()))
                          .toList();
                  if (results.isEmpty) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Text(
                          "No data available",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        // onTap: () => Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => View(
                        //             student: results[index], index: index))),
                        // tileColor: Colors.white,
                         onTap: () {
                          Get.to(() =>
                              View(student: results[index], index: index));
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: Image.file(File(results[index].imagePath))
                                    .image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        title: Text(results[index].name!),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
