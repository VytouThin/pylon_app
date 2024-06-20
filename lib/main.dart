import 'package:app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app/screens/signup_page.dart';
import 'package:app/screens/employee_list_page.dart';
import 'package:app/screens/employee_edit_page.dart';
import 'package:app/models/employee.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/employees': (context) => EmployeeListPage(),
        '/employee/edit': (context) {
          final employee =
              ModalRoute.of(context)!.settings.arguments as Employee;
          return EmployeeEditPage(employee: employee);
        },
      },
    );
  }
}
