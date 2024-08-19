import 'package:flutter/material.dart';
import 'package:school_app/Screens/AddStudentScreen.dart';
import 'package:school_app/Screens/ListStudentsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: ListStudentsScreen.routeName,
      routes: {
        ListStudentsScreen.routeName : (context)=>ListStudentsScreen(),
        AddStudentScreen.routeName : (context)=> AddStudentScreen()
      },
    );
  }
}
