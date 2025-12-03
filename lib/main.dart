import 'package:flutter/material.dart';
import 'package:flutter_dpr/Modal/dpr.dart';
import 'package:flutter_dpr/Modal/login.dart';
import 'package:flutter_dpr/Modal/project_list.dart';
import 'package:flutter_dpr/View/loginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            return Login(email: '@test.com', password: 123456);
          },
        ),
        Provider(
          create: (context) {
            return ProjectList(
              projects: [
                {
                  "title": "Building Construction",
                  "status": "Active",
                  "buttonColor": Colors.blue,
                  "date": "09/09/2025",
                },
                {
                  "title": "Site Visit",
                  "status": "On hold",
                  "buttonColor": Colors.orange,
                  "date": "15/10/2025",
                },
                {
                  "title": "Workers Payment",
                  "status": "Completed",
                  "buttonColor": Colors.green,
                  "date": "25/05/2025",
                },
                {
                  "title": "Land Mining",
                  "status": "On hold",
                  "buttonColor": Colors.orange,
                  "date": "05/05/2025",
                },
                {
                  "title": "Hospital Redevelopment",
                  "status": "Active",
                  "buttonColor": Colors.blue,
                  "date": "30/07/2025",
                },
              ],
            );
          },
        ),
        Provider(
          create: (context) {
            return Dpr(
              date: DateTime.now(),
              wheather: "Wheather",
              description: "Describe today's work.......",
              workerCount: "Worker Count",
            );
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
