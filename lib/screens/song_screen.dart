import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'dart:ui' as ui;

import 'package:playemo/widgets/song_tile.dart';

class SongScreen extends StatefulWidget {
  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    String imgPath = arguments['cover'];
    String artist = arguments['artist'];
    String album = arguments['album'];
    String description = arguments['description'];

    return Scaffold(
      backgroundColor: AppColor.darkThemeBackground,
      body: Stack(
        children: [
          Container(
            height: height(context),
            width: width(context),
          ),
          Container(
            height: height(context),
            width: width(context),
            child: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: height(context) * 0.5,
                      width: width(context),
                    ),
                    Container(
                      height: height(context) * 0.5,
                      width: width(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(18)
                        )
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(48)
                        ),
                        child: Hero(
                          tag: imgPath,
                            child: Image.asset(
                                imgPath,
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: height(context) * 0.35
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              artist,
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white38,
                              ),
                            ),
                            SizedBox(height: 5,),
                            Text(
                              album,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height(context) * 0.05,
                    left: width(context) * 0.125,
                    right: width(context) * 0.05,
                    bottom: 30
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            album,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            '10 songs',
                            style: TextStyle(
                              color: Colors.white60
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        /**This is where description of the song or album would go*/
                        child: Text(
                          'This album is the third studio album by Nigerian singer Derhnyel'
                              ' which was released on August 10, 2020',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                            wordSpacing: 1.5,
                            letterSpacing: 0.5
                          ),
                        ),
                        width: width(context) * 0.7,
                      )
                    ],
                  ),
                ),
                SongTile(
                  artist: artist,
                  song: 'Neone paradise',
                  duration: '3:00',
                ),SongTile(
                  artist: artist,
                  song: 'Sweet dreams',
                  duration: '2:57',
                )

              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: 40
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: width(context) * 0.15,
              top: height(context) * 0.5
            ),
            child: Container(
              height: 50, width: 50,
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
          )
        ],
      ),
    );
  }
}
