import 'package:flutter/material.dart';
import 'package:playemo/screens/landing.dart';
import 'package:playemo/screens/song_screen.dart';
import 'package:playemo/screens/most_popular_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'most_popular': (context) => MostPopularScreen(),
        'song_screen': (context) => SongScreen()
      },
      home: LandingScreen(),
    );
  }
}
