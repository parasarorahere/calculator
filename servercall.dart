
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
  bool isPlay = true;

  callServer() async {
    var result = await http
        .get('https://itunes.apple.com/search?term=sidhuMoosewala'
        '&limit=100');
 // print("paras first result is $result");
    var obj = json.decode(result.body);
// in obj we get two things one is resultCount and other is results
   // print("Obj is $obj");
    var arr = obj['results'];
 //   print( "paras obj is $arr");

    List<MySong> songList2 = [];

    //for (int i = 0; i < obj['resultCount']; i++)
      for (int i = 0; i < arr.length; i++){
       var songObj = arr[i];
       MySong song = new MySong(
          songObj['trackName'], songObj['artistName'], songObj['previewUrl']);
      songList2.add(song);
    }

 //   print("Now SOngList is ");
    for (int i = 0; i < songList2.length; i++) {
   //   print("Song is ${songList2[i].trackName}");
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
                Expanded(
                  child: IconButton(
                //  icon: Icon( Icons.play_arrow),
                  padding: EdgeInsets.all(7.0),
                 icon: Icon(isPlay? Icons.play_arrow:Icons.pause),
                  onPressed: () {

                  //  print("flow before pressed $boola");
                 bool bool1= _playSong(index ,);
                 print("after pressing button $bool1");

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
        _playSong( index ) async {
         AudioPlayer audioPlayer = AudioPlayer();
         print("flow is before if $isPlay");

         if (isPlay ) {
           print("flow is in if condition $isPlay");
           await audioPlayer.play(
               songList[index].previewUrl);
             isPlay=false;
          // print("flow is in if condition 2 $boola");

         }
         else
           {
             await audioPlayer.stop();
             print("now flow is in else statement $isPlay");
              isPlay=true;
             print("now flow is in else statement2 $isPlay");

           }

       }




  @override
  Widget build(BuildContext context) {
    callServer();
    return _funReturnListTitle();
  }
}
