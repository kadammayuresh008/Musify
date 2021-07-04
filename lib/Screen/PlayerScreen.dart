import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatefulWidget {
  var data;
  var index;
  PlayerScreen({Key key, this.data, this.index}) : super(key: key);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache;
  bool _pause = true;
  dynamic totalDuration;
  dynamic _playerPosition;

  @override
  initState() {
    super.initState();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  initAudio(String path) async {
    await audioCache.play(path);
    setState(() {
      _pause = false;
    });
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      setState(() {
        totalDuration = updatedDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((position) {
      setState(() {
        _playerPosition = position;
        // _value = position as int;
      });
    });
  }

  pauseAudio() {
    audioPlayer.pause();
    setState(() {
      _pause = true;
    });
  }

  stopAudio() {
    audioPlayer.stop();
    setState(() {
      _pause = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var songData = widget.data[widget.index];
    var _value;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar:
            AppBar(title: Text("Musify"), backgroundColor: Colors.green[900]),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              SizedBox(height: 200.0),
              Center(
                  child: Image.asset(
                songData["musicImage"],
              )),
              SizedBox(height: 10.0),
              Text(
                songData["name"],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                songData["artist"][0],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                        elevation: 0.8,
                        color: Colors.black,
                        onPressed: () {},
                        child:
                            Icon(Icons.loop, color: Colors.white, size: 35.0)),
                  ),
                  Expanded(
                    child: RaisedButton(
                        elevation: 0.8,
                        color: Colors.black,
                        onPressed: () {},
                        child: Icon(Icons.replay_10,
                            color: Colors.white, size: 45.0)),
                  ),
                  Expanded(
                    child: Container(
                      child: RaisedButton(
                        elevation: 1.0,
                        color: Colors.black,
                        onPressed: () {
                          _pause
                              ? initAudio(
                                  songData["musicUrl"],
                                )
                              : pauseAudio();
                        },
                        child: _pause
                            ? Icon(Icons.play_circle_fill_sharp,
                                color: Colors.white, size: 70.0)
                            : Icon(Icons.pause_circle_filled_sharp,
                                color: Colors.white, size: 70.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                        elevation: 0.8,
                        color: Colors.black,
                        onPressed: () {
                          stopAudio();
                        },
                        child: Icon(Icons.forward_10,
                            color: Colors.white, size: 45.0)),
                  ),
                  Expanded(
                    child: RaisedButton(
                        elevation: 0.8,
                        color: Colors.black,
                        onPressed: () {},
                        child: Icon(Icons.shuffle,
                            color: Colors.white, size: 35.0)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _playerPosition == null
                            ? "0:00:00"
                            : _playerPosition.toString().split('.').first,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      Text(
                        totalDuration == null
                            ? "0:00:00"
                            : totalDuration.toString().split('.').first,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ]),
              ),
              Slider(
                value: _playerPosition == null
                    ? 0
                    : _playerPosition.inMilliseconds.toDouble(),
                min: 0,
                max: totalDuration == null
                    ? 20
                    : totalDuration.inMilliseconds.toDouble(),
                activeColor: Colors.green,
                inactiveColor: Colors.white,
                onChanged: (double value) {
                  _value = value as int;
                },
              )
            ])));
  }
}
