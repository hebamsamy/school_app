import 'package:flutter/material.dart';
import 'package:school_app/Screens/AddStudentScreen.dart';
import 'package:school_app/models/ApiHelper.dart';
import 'package:school_app/models/student.dart';

class ListStudentsScreen extends StatefulWidget {
  const ListStudentsScreen({super.key});
  static String routeName = "/";
  @override
  State<ListStudentsScreen> createState() => _ListStudentsScreenState();
}

class _ListStudentsScreenState extends State<ListStudentsScreen> {
  List<Student> list = [];
  @override
  void initState() {
    super.initState();
    print("init");
    loadData();
  }

  loadData() async {
    var temp = await Apihelper().listStudents();
    setState(() {
      list = temp;
    });
  }

  delete(Student student) async {
    bool success = await Apihelper().deleteStudent(student.ID);
    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${student.Name} Deleted Susseccfully"),
        ),
      );
      // loadData(); OR
      setState(() {
        list.remove(student);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sorry something Wrong happened !!!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Of Students"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(AddStudentScreen.routeName)
                  .then((route) {
                print("after back from pop (current screen on stack)");
                loadData();
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: list
            .map(
              (element) => Dismissible(
                onDismissed: (dir) {
                  delete(element);
                },
                key: Key(element.ID.toString()),
                child: Card(
                  child: ListTile(
                    title: Text(element.Name),
                    subtitle: Text(element.Email),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
