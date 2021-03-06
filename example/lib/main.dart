import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(
    new ChewieDemo(
      controller: new VideoPlayerController(
        'https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4',
      ),
    ),
  );
}

class ChewieDemo extends StatefulWidget {
  final String title;
  final VideoPlayerController controller;

  ChewieDemo({this.title = 'Chewie Demo', this.controller});

  @override
  State<StatefulWidget> createState() {
    return new _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: widget.title,
      theme: new ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        bottomNavigationBar: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
                      children: <Widget>[

                          new FlatButton(
                            onPressed: () {
                              setState(() {
                                _platform = TargetPlatform.android;
                              });
                            },
                            highlightColor: Colors.greenAccent,
                            color: Colors.green,
                            child: new Padding(
                              child: new Text("Android controls"),
                              padding: new EdgeInsets.symmetric(vertical: 16.0),
                            ),
                          ),

                         new FlatButton(
                            onPressed: () {
                              setState(() {
                                _platform = TargetPlatform.iOS;
                              });
                            },
                            highlightColor: Colors.blueAccent,
                            color: Colors.blue,
                            child: new Padding(
                              padding: new EdgeInsets.symmetric(vertical: 16.0),
                              child: new Text("iOS controls"),
                            ),
                          ),

                      ],
                    ),
        body: new Column(
          children: <Widget>[
            new Container(
              child: new Center(
                child: new Chewie(
                  widget.controller,
                  aspectRatio: 3 / 2,
                  autoPlay: false,
                  looping: true,

                  // Try playing around with some of these other options:

                  showControls: true,
                  materialProgressColors: new ChewieProgressColors(
                    playedColor: Colors.red,
                    handleColor: Colors.blue,
                    backgroundColor: Colors.grey,
                    bufferedColor: Colors.lightGreen,
                  ),
                  placeholder: new Container(
                    color: Colors.grey,
                  ),
                  autoInitialize: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

