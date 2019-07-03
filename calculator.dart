import  'package:flutter/material.dart';
class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {


  // this function return answer widget
 Widget  _answerWidget()
  {
    return Row(
      children: <Widget>[

        Expanded(

          child: Container(

            padding: EdgeInsets.all(12),
            height: 150,
            color: Colors.purple[200],
            child:Text("hello",style:TextStyle(fontStyle: FontStyle.normal,fontSize: 40),textDirection: TextDirection.rtl,

            ),
          ),
          flex: 1,

        ),
      ],
    );

  }


  // function which return button Widget take input String for text
 Widget _funReturnButton(String buttonText )
 {
   return MaterialButton(
      height: 110,
     //color: Colors.red,
     onPressed: ()
     {

     },
     child: Text(
       buttonText,
       style: TextStyle(fontSize: 30),
     ),
   );
 }


  // this function returns the widgets 4*4 all numbers and + - =etc
 Widget _numberAndPlusMinus(String buttonText ,String buttonText2,String buttonText3 ,String buttonText4)
 {
   return

     Row(
       children: <Widget>[

         Expanded(
           child: _funReturnButton(buttonText),
           flex: 1,

         ),
         Expanded(
           child: _funReturnButton(buttonText2),
           flex: 1,
         ),
         Expanded(
           child: _funReturnButton(buttonText3),
           flex: 1,
         ),
         Expanded(
           child: _funReturnButton(buttonText4),
           flex: 1,
         ),
       ],
     );



 }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          _answerWidget(),
          _numberAndPlusMinus("7", "8", "9", "+"),
        _numberAndPlusMinus("4", "5", "6", "-"),
         _numberAndPlusMinus("1", "2", "3", "*"),
        _numberAndPlusMinus("0", "", "/", "="),




        ],
      ),
    );

  }
}