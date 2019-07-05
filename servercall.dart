
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayer/audioplayer.dart';

class MySong {
  String artistName;
  String trackName;
  String previewUrl;

  MySong(this.trackName, this.artistName, this.previewUrl);
}

class ServerCall extends StatefulWidget {
  @override
  _ServerCallState createState() => _ServerCallState();
}

class _ServerCallState extends State<ServerCall> {
  List<MySong> songList = [];
  callServer() async {
    var result = await http
        .get('https://itunes.apple.com/search?term=jack+johnson&limit=10');
 // print("paras first result is $result");
    var obj = json.decode(result.body);
// in obj we get two things one is resultCount and other is results
   // print("Obj is $obj");
    var arr = obj['results'];
    print( "paras obj is $arr");

    List<MySong> songList2 = [];

    //for (int i = 0; i < obj['resultCount']; i++)
      for (int i = 0; i < arr.length; i++){
       var songObj = arr[i];
       MySong song = new MySong(
          songObj['trackName'], songObj['artistName'], songObj['previewUrl']);
      songList2.add(song);
    }

    print("Now SOngList is ");
    for (int i = 0; i < songList2.length; i++) {
      print("Song is ${songList2[i].trackName}");
    }
    setState(() {
      songList = songList2;
    });
  }

  _funReturnListTitle()
  {
    return  Container(
      child: ListView.builder(
          itemCount: songList.length,
          itemBuilder: (context, index) {
            return Row(

              children: <Widget>[
                Expanded(child:
                ListTile(
                  // leading: Icon(Icons.email),
                  title: Text(songList[index].trackName),
                  subtitle: Text(songList[index].artistName),
                  //  trailing: Icon(Icons.play_arrow),

                ),
                  flex: 8,
                ),
                Expanded(child:
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  padding: EdgeInsets.all(7.0),
                  onPressed: () {
                  _playSong(index);

                  },
                ),
                  flex: 1,
                ),

              ],
            );


          }),
    );
  }

  // fun Play Song
       _playSong( index) async {
    print("Play Song Called");
    AudioPlayer audioPlayer = AudioPlayer();
    await audioPlayer.play(
        songList[index].previewUrl);
  }




  @override
  Widget build(BuildContext context) {
    callServer();
    return _funReturnListTitle();


    /*  Container(
      child: ListView.builder(
          itemCount: songList.length,
          itemBuilder: (context, index) {
            return Row(

              children: <Widget>[
             Expanded(child:
              ListTile(
             // leading: Icon(Icons.email),
              title: Text(songList[index].trackName),
              subtitle: Text(songList[index].artistName),
           //  trailing: Icon(Icons.play_arrow),

            ),
               flex: 8,
             ),
                Expanded(child:
                IconButton(
                  icon: Icon(Icons.play_arrow),
                  padding: EdgeInsets.all(7.0),
                  onPressed: () {
                    

                  },
                ),
                  flex: 1,
                ),

            ],
            );

      /*
              ListTile(
              title: Text(
                songList[index].trackName,
                style: TextStyle(fontSize: 40),
              ),
            );

            */
          }),
//      child: RaisedButton(
//        onPressed: () {
//          callServer();
//        },
//        child: Text('Call Server'),
//      ),
    );

    */
  }
}
