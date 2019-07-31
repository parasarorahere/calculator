import 'package:flutter/material.dart';

import 'package:http/http.dart' ;

import 'dart:convert';
import 'dataModel.dart';


class jsonList extends StatefulWidget {
  String authToken;

  jsonList(token) {
    this.authToken = token;
  }


  @override
  _jsonListState createState() => _jsonListState(
  );
}


class _jsonListState extends State<jsonList> {

  // List<Sr> popupmenu;

  List<String> selectedLocations = List();
  MasterData masterData;

  _makeGetRequest(String token) async {

    print("Master Data called $token");
    // make GET request
    String url = 'http://192.168.0.102/EXPAudit63/api/users/GetMasterData/1';
    Map<String, String> headers = {"Content-Type": "application/json","timezone": "GMT+5:30","offset":"5.5","Auth_Token":token};
    Response response = await get(url,headers: headers);
    // sample info available in response
    var bodyResponse = response.body;
    //   print("body response is $bodyResponse");

    var  data = json.decode(response.body);
    masterData = MasterData(data["data"]);
    setState(() {
      masterData: masterData;
    });
  }

  Widget build(BuildContext context) {
    var valueOfDropDown ="One";

    if (masterData == null) {
      _makeGetRequest(widget.authToken);
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("EXP",style: TextStyle(fontSize: 20),),

        ),
        body: Container(

          child: ListView.builder
            (
              itemCount: (masterData != null) ? masterData.locationlevels.length : 0,
              itemBuilder: (BuildContext ctxt, int index) {
                return   ListTile(
                  onTap: (){} ,
                  title: Text(masterData.locationlevels[index].levelName,style: TextStyle(fontSize: 30),),
                  subtitle: DropdownButton<String>(

                    value: valueOfDropDown ,
                    onChanged: (String newValue) {
                      setState(() {
                        valueOfDropDown =newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Free', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),

                  ),


                );
              }
          ),

        )
    );
  }
}