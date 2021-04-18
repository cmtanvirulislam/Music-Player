import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMusic(),
    );
  }
}

class MyMusic extends StatefulWidget {
  @override
  _MyMusicState createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;
  AudioPlayer _player;
  AudioCache cache;
  Duration position = new Duration();
  Duration musicLength = new Duration();
  Widget slider(){
    return Container(
      width: 300.0,
      child: Slider.adaptive(
        activeColor: Colors.blue[800],
        inactiveColor: Colors.greenAccent[350],
        value: position.inSeconds.toDouble(),
        max: musicLength.inSeconds.toDouble(),
        onChanged: (value){
          seekToSec(value.toInt());
        }),
    );
  }

  void seekToSec(int sec){
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };

    cache.load("Ekla holei bujhte pari.mp3");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.lightBlue[800],
                Colors.lightBlue[200],
              ]),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 48.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Music Beats",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Text(
                    "Listen to your favorite music",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60.0),
                        image: DecorationImage(
                          image: AssetImage("imasong/music.jpg"),
                        )),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Center(
                  child: Text(
                    "Stargazer",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(38.0),
                        topRight: Radius.circular(38.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 500.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${position.inMinutes}:${position.inSeconds
                                  .remainder(60)}",style: TextStyle(fontSize:
                              18.0),),
                              slider(),
                              Text("${musicLength.inMinutes}:${musicLength.inSeconds
                                  .remainder(60)}",style: TextStyle(fontSize:
                                  18.0),),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                iconSize: 45.0,
                                color: Colors.blue,
                                onPressed: (){},
                                icon: Icon(Icons.skip_previous),
                               ),
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.blue[800],
                              onPressed: () {
                                if(!playing){
                                  cache.play("Ekla.mp3");
                                  setState(() {
                                    _player.pause();
                                    playBtn = Icons.pause;
                                    playing=true;
                                  });
                                }else{
                                  setState(() {
                                    playBtn = Icons.play_arrow;
                                    playing=false;
                                  });
                                }
                              },
                              icon: Icon(playBtn),
                              ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.blue,
                              onPressed: (){},
                              icon: Icon(Icons.skip_next),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
