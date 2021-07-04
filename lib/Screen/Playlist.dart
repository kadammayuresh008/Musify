import 'package:flutter/material.dart';
import 'package:musify/Screen/Playhome.dart';

import 'PlayHomeHorizontal.dart';

class Playlist extends StatefulWidget {
  const Playlist({Key key}) : super(key: key);

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text("Musify"),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.next_plan,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/playerScreen');
                })
          ],
          backgroundColor: Colors.green[900]),
      body:
          // PlayHomeHorizontal(),
          Playhome(),
    ));
  }
}
