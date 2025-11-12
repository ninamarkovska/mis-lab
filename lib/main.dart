import 'package:flutter/material.dart';
import 'package:mis_lab/screens/details.dart';
import 'package:mis_lab/screens/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExamTracker',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Распоред на испити - 221022'),
        "/details": (context) => const DetailsPage(),
      },
    );
  }
}



