import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management/controller/controller.dart';
import 'mj/model/model.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);

  String? _name;

  int? _age;

  String? _domain;

  int? _phone;

  dynamic _pic;

  final _formKey = GlobalKey<FormState>();
  Box<Model> box = Hive.box<Model>('records');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.grey[800]),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(255, 174, 165, 100),
          title: Text(
            "Add new Students",
            style: TextStyle(
                color: Colors.grey[800],
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
        ),
        body: Form(
            key: _formKey,
            child: ListView(children: [
              const Padding(padding: EdgeInsets.all(5)),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length > 2) {
                      _name = value;
                      return null;
                    } else if (value.length < 3) {
                      return 'Plear Enter a name';
                    }
                  },
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
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
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black87),
                    helperStyle: TextStyle(color: Colors.black45),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length == 2 || value.length == 1) {
                      _age = int.parse(value);
                      return null;
                    }
                    return 'Please enter Age';
                  },
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length > 3) {
                      _domain = value;
                      return null;
                    } else if (value.length < 2) {
                      return 'Enter a valid domain';
                    }
                  },
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: TextFormField(
                  // validator: (value) {
                  //    if (value!.length == 10) {
                  //      _phone = int.parse(value);
                  //      return null;
                  //  }
                  //   // return "Enter valid number";

                  // },
                  validator: (value) {
                    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = RegExp(patttern);
                    if (value!.isEmpty) {
                      return 'Please enter mobile number';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid mobile number';
                    } else if (value.length == 10) {
                      _phone = int.parse(value);
                      return null;
                    }
                  },
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 19.0, color: Colors.black),
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
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                child: ElevatedButton(
                  child: Text(
                    "Pic",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  onPressed: () async {
                    final ImagePicker _picker = ImagePicker();
                    final XFile? image =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      _pic = image.path;
                    }
                    return null;
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Color.fromRGBO(255, 174, 165, 100),
                      textStyle: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              GetBuilder<StudentController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Get.back();
                        box.add(Model(
                            name: _name,
                            age: _age,
                            domain: _domain,
                            phone: _phone,
                            imagePath: _pic));
                      }
                      controller.update();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Color.fromRGBO(255, 174, 165, 100),
                        textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                );
              }),
            ])));
  }
}
