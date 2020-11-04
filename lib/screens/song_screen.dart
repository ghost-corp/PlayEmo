import 'dart:io';

import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'package:playemo/widgets/playing_widget.dart';

import 'package:playemo/widgets/song_tile.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class SongScreen extends StatefulWidget {
  final AlbumInfo albumInfo;

  const SongScreen({this.albumInfo});

  @override
  _SongScreenState createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<SongInfo> songInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.darkThemeBackground,
      body: Stack(
        children: [
          Container(
            height: height(context),
            width: width(context),
          ),
          SafeArea(
            child: Container(
              height: height(context),
              width: width(context),
              child: Column(
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
                                bottomRight: Radius.circular(18))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(48)),
                          child: Hero(
                              tag: widget.albumInfo.title,
                              child: widget.albumInfo.albumArt == null
                                  ? Image.asset(
                                      'assets/no_cover.png',
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(widget.albumInfo.albumArt),
                                      fit: BoxFit.fill,
                                    )),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: height(context) * 0.35),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.albumInfo.artist,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white38,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.albumInfo.title,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: height(context) * 0.45,
                      width: width(context),
                      child: FutureBuilder(
                        future: audioQuery.getSongsFromAlbum(
                            albumId: widget.albumInfo.id),
                        builder: (context, snapshot) {
                          List<Widget> songsWidget = [];

                          songInfo = snapshot.data;

                          if(snapshot.data == null) {
                            return Center(
                              child: Container(
                                height: 60, width: 60,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          songInfo.forEach((element) {
                            songsWidget.add(
                              SongTile(
                                artist: element.artist,
                                song: element.title,
                                duration: element.duration,
                              )
                            );
                          });

                          return ListView(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height(context) * 0.05,
                                    left: width(context) * 0.125,
                                    right: width(context) * 0.05,
                                    bottom: 30),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.albumInfo.title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          widget.albumInfo.numberOfSongs,
                                          style:
                                              TextStyle(color: Colors.white60),
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
                                            letterSpacing: 0.5),
                                      ),
                                      width: width(context) * 0.7,
                                    )
                                  ],
                                ),
                              ),
                              ...songsWidget,
                              SizedBox(
                                height: 150,
                              )
                            ],
                          );
                        },
                      ))
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 40),
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
                left: width(context) * 0.15, top: height(context) * 0.5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  gradient: LinearGradient(
                      colors: [AppColor.primary, AppColor.primary1])),
              child: Center(
                child: Icon(
                  Icons.play_arrow_outlined,
                  color: Colors.white54,
                  size: 30,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: PlayingWidget(
              imgPath: 'assets/no_cover.png',
              artist: widget.albumInfo.artist,
              song: 'Neon paradise',
            ),
          )
        ],
      ),
    );
  }
}
