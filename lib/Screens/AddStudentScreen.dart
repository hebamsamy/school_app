import 'package:flutter/material.dart';
import 'package:school_app/models/ApiHelper.dart';
import 'package:school_app/models/student.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  static String routeName = "/add";

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  var formKey = GlobalKey<FormState>();
  Student student = Student();
  
  void savaData() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState?.save();
      // call Api
      bool success = await Apihelper().addStudent(student);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Added Susseccfully"),
            action: SnackBarAction(
              label: "Add more",
              onPressed: () {
                formKey.currentState?.reset();
              },
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sorry something wrong happened !!!"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Student"),
      ),
      body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text("First Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      } else if (value.length < 3) {
                        return "Name Must be atleast 3 letters";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        student.FirstName = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text("Last Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      } else if (value.length < 3) {
                        return "Name Must be atleast 3 letters";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        student.LastName = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: const Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    validator: (value) {
                      var pattern = RegExp(
                          r"^((?!\.)[\w\-_.]*[^.])(@\w+)(\.\w+(\.\w+)?[^.\W])$");
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      } else if (!pattern.hasMatch(value)) {
                        return "Email Must be Like : example@gmail.com";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        student.Email = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text("Phone Number"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    validator: (value) {
                      var pattern = RegExp(r"^\d\$");
                      //TO DO :
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      } else if (pattern.hasMatch(value)) {
                        return "Must enter numbers";
                      } else if (value.length < 11) {
                        return "Phone number Must be 11 digit";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        student.Mobile = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text("National ID"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    validator: (value) {
                      var pattern = RegExp(r"^\d\$");
                      //TO DO :
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      } else if (pattern.hasMatch(value)) {
                        return "Must enter numbers";
                      } else if (value.length < 14) {
                        return "Phone number Must be 14 digit";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        student.NationalID = newValue!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: const Text("Age"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    validator: (value) {
                      var pattern = RegExp(r"^\d\$");
                      //TO DO :
                      if (value == null || value.isEmpty) {
                        return "This field is Required";
                      } else if (pattern.hasMatch(value)) {
                        return "Must enter numbers";
                      } else if (int.parse(value) < 18) {
                        return "Not valid Age";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        student.Age = int.parse(newValue!);
                      });
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      savaData();
                    },
                    child: const Text("Add Student"))
              ],
            ),
          )),
    );
  }
}
