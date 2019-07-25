import 'package:flutter/material.dart';
class LoginPAge extends StatefulWidget {
  @override
  _LoginPAgeState createState() => _LoginPAgeState();
}

class _LoginPAgeState extends State<LoginPAge> {
  String userName;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("EXP",style: TextStyle(fontSize: 20),),

      ),
      body: Container(
        child: Stack(
          children: <Widget>[
     Positioned(
     top: 10,
    left: 90,
    width: 500,
    height: 100,
    child: Container(
       child: Image.asset("abc.jpg",
         width: 600.0,
         height: 240.0,
         fit: BoxFit.cover,),
    ) 
      ),
            Positioned(
                top: 10,
                left: 90,
                width: 500,
                height: 100,
                child: Container(
                  child:TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your name'

                    ),
                    onChanged: (String inputUserName){
                      userName=inputUserName;
                    },
                  ),
                )
            ),
    ]),
    ),
    );
  }

}
