import 'package:flutter/material.dart';
import 'package:musify/Screen/Playhome.dart';
import 'package:musify/Screen/newRelease/newReleaseList.dart';
import 'package:musify/Screen/Albums/AlbumList.dart';
import 'package:musify/Screen/Genre/GenreList.dart';
import 'package:musify/Screen/Artist/ArtistList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    NewRelease(),
    AlbumList(),
    GenreList(),
    ArtistList(),
    Playhome(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text("Musify"),
          actions: [],
          backgroundColor: Colors.green[900]),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[900],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases),
            title: Text('New Release'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.album),
            title: Text("Album"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_video),
            title: Text('Genre'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Artist'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            title: Text('My Playlist'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        onTap: _onItemTapped,
      ),
    );
  }
}
