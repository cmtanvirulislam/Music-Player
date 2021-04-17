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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                iconSize: 45.0,
                                color: Colors.green,
                                icon: Icon(Icons.skip_previous),
                                onPressed: (){},
                                ),
                            IconButton(
                              iconSize: 62.0,
                              color: Colors.green[800],
                              icon: Icon(Icons.play_arrow),
                              onPressed: (){},
                            ),
                            IconButton(
                              iconSize: 45.0,
                              color: Colors.green,
                              icon: Icon(Icons.skip_next),
                              onPressed: (){},
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
