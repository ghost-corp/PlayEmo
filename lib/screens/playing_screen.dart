import 'package:flutter/material.dart';

class PlayingScreen extends StatefulWidget {
  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'play-emo',
      child: Scaffold(),
    );
  }
}
