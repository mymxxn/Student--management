import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:student_management/controller/controller.dart';
import 'mj/model/model.dart';

class edit extends StatelessWidget {
  edit({Key? key, required this.student, required this.index})
      : super(key: key);
  Model student;
  int index;
  final _formKey = GlobalKey<FormState>();

  Box<Model> box = Hive.box<Model>('records');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          backgroundColor: Color.fromRGBO(255, 216, 190, 100),
          elevation: 0,
          title: Text(
            student.name!,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: GetBuilder<StudentController>(builder: (controller) {
          return Form(
              child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  initialValue: student.name,
                  //keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    labelText: "Name",
                    labelStyle: TextStyle(color: Colors.black87),
                    helperStyle: TextStyle(color: Colors.black45),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Name required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.name = (value);
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  initialValue: student.age.toString(),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    labelText: "Age",
                    labelStyle: TextStyle(color: Colors.black87),
                    helperStyle: TextStyle(color: Colors.black45),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Student Age required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.age = int.parse(value);
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  initialValue: student.domain,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    labelText: "Domain",
                    labelStyle: TextStyle(color: Colors.black87),
                    helperStyle: TextStyle(color: Colors.black45),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Domain required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.domain = (value);
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: TextFormField(
                  initialValue: student.phone.toString(),
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        borderSide: BorderSide(color: Colors.black87)),
                    labelText: "Phone No.",
                    labelStyle: TextStyle(color: Colors.black87),
                    helperStyle: TextStyle(color: Colors.black45),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    if (value == "") {
                      return "Phone No. required";
                    }
                  },
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      student.phone = int.parse(value);
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      student.save();
                      controller.update();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color.fromRGBO(255, 216, 190, 100),
                        textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                    child: Text('Submit',
                        style: TextStyle(color: Colors.grey[700]))),
              ),
            ],
          ));
        }));
  }
}
