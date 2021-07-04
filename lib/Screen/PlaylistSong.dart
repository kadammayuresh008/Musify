import 'package:flutter/material.dart';
import 'package:musify/Screen/PlayerScreen.dart';

class PlaylistSong extends StatefulWidget {
  var index;
  var playlist;
  PlaylistSong({Key key, this.index, this.playlist})
      : super(
          key: key,
        );

  @override
  _PlaylistSongState createState() => _PlaylistSongState();
}

class _PlaylistSongState extends State<PlaylistSong> {
  @override
  Widget build(BuildContext context) {
    var data = widget.playlist[widget.index]["songs"];
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Musify"),
          backgroundColor: Colors.green[900],
        ),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PlayerScreen(data: data, index: index)),
                  );
                },
                title: Text(
                  data[index]["name"],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                subtitle: Text(
                  data[index]["artist"][0],
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading:
                    CircleAvatar(child: Image.asset(data[index]["musicImage"])),
              );
            }));
  }
}
