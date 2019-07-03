import 'package:flutter/material.dart';
//import './greet.dart';
import './calculator.dart';
//import 'package:greetapp/raw/Firststate.dart';
//import 'package:greetapp/raw/sizeBox.dart';
void main() {
  runApp(MaterialApp(
      title: 'calculator',

      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(

          title: Text(
            'calculator',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.purple,
        ),


       body: calculator() ,









      )));

}
