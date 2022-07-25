import 'package:flutter/material.dart';
import 'package:untitled/Ui/blood_sugar_list.screen.dart';

void main() => runApp(const MyApp());
// contains app bar for different pages
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reddit',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}
class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // body: SignIn(),
      body:
      BloodSugar(),
    );
  }
}
