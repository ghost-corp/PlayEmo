import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'dart:ui' as ui;

import 'package:playemo/screens/playing_screen.dart';

class PlayingWidget extends StatefulWidget {

  final String imgPath;
  final String artist;
  final String song;

  const PlayingWidget({this.artist, this.song, this.imgPath});

  @override
  _PlayingWidgetState createState() => _PlayingWidgetState();
}

class _PlayingWidgetState extends State<PlayingWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(createRoute());
      },
      child: Material(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.only(
            left: 15, right: 15
          ),
          width: width(context),
          height: 70,
          color: AppColor.darkThemeBackground,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 55, height: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Hero(
                        tag: 'playing_image',
                        child: Image.asset(
                          widget.imgPath
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'playing_song',
                        child: Text(
                            widget.song.length < 25 ?
                            widget.song : widget.song.substring(0, 25) + '...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Hero(
                        tag: 'playing_artist',
                        child: Text(
                          widget.artist.length < 30 ?
                          widget.artist : widget.artist.substring(0, 30) + '...',
                          style: TextStyle(
                              color: Colors.white38,
                              fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow_sharp,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(width: 10,),
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (Rect bounds) {
                      return ui.Gradient.linear(
                        Offset(24,  4),
                        Offset(4, 24),
                        [AppColor.primary, AppColor.primary1]
                      );
                    },
                    child: Icon(
                      Icons.favorite_outlined,
                    ),
                  ),
                  SizedBox(width: 10,),
                  Icon(
                    Icons.fast_forward,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Route createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => PlayingScreen(
          imgPath: widget.imgPath,
          artist: widget.artist,
          song: widget.song,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 400),
      reverseTransitionDuration: Duration(milliseconds: 400)
    );
  }
}

