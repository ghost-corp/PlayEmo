import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'dart:ui' as ui;

class PlayingScreen extends StatefulWidget {

  final String imgPath;
  final String song;
  final String artist;

  const PlayingScreen({this.imgPath, this.artist, this.song});

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            height: height(context),
            width: width(context),
          ),
          Container(
            height: height(context),
            width: width(context),
            child: Hero(
              tag: 'playing_image',
              child: Image.asset(
                widget.imgPath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width(context),
              height: 280,
              decoration: BoxDecoration(
                color: Color.fromRGBO(105, 105, 105, 0.5),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.song,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    widget.artist,
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 20,),
                  Stack(
                    children: [
                      Container(
                        child: Divider(thickness: 2, color: Colors.white38,),
                        width: width(context) * 0.9,
                      ),
                      Container(
                        child: Divider(thickness: 2, color: Colors.deepPurple,),
                        width: width(context) * 0.4,
                      ),
                    ],
                  ),
                  Container(
                    width: width(context) * 0.9,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1:35',
                          style: TextStyle(
                            color: Colors.white60
                          ),
                        ),
                        Text(
                          '3:30',
                          style: TextStyle(
                            color: Colors.white60
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.repeat,
                        color: Colors.white38,
                      ),
                      SizedBox(width: 20,),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return ui.Gradient.linear(
                            Offset(4, 24),
                            Offset(24, 4),
                            [AppColor.primary, AppColor.primary1]
                          );
                        },
                        child: Icon(
                          Icons.fast_rewind,
                          size: 40,
                        ),
                      ),
                      Container(
                        height: 50, width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primary, width: 2),
                          borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(
                          child: Container(
                            height: 40, width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                gradient: LinearGradient(
                                    colors: [AppColor.primary, AppColor.primary1]
                                )
                            ),
                            child: Center(
                              child: Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white54,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (Rect bounds) {
                          return ui.Gradient.linear(
                              Offset(4, 24),
                              Offset(24, 4),
                              [AppColor.primary, AppColor.primary1]
                          );
                        },
                        child: Icon(
                          Icons.fast_forward,
                          size: 40,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Icon(
                        Icons.favorite_outline,
                        color: Colors.white38,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
