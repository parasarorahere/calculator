import 'package:flutter/material.dart';
import './jsonList.dart';
import './LoginPAge.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exp',
      
      home: LoginPAge(),
    );
  }
}
