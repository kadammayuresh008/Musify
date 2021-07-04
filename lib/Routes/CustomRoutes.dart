import 'package:flutter/material.dart';
import 'package:musify/Screen/PlayerScreen.dart';
import 'package:musify/Screen/Playlist.dart';
import 'package:musify/Screen/Home/Home.dart';

var customRoutes = <String, WidgetBuilder>{
  '/': (context) => HomePage(),
  '/playerScreen': (context) => PlayerScreen(),
};
