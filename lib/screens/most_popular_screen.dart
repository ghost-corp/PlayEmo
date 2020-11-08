import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'package:playemo/models/music_model.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:playemo/widgets/song_card.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class MostPopularScreen extends StatefulWidget {
  @override
  _MostPopularScreenState createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<AlbumInfo> albums;
  List<SongInfo> songs;
  List<PlaylistInfo> playlists;

  @override
  Widget build(BuildContext context) {
    return Consumer<MusicModel>(
      builder: (context, musicModel, child) {
        return Scaffold(
          backgroundColor: AppColor.darkThemeBackground,
          body: Stack(
            children: [
              Container(
                height: height(context),
                width: width(context),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height(context) * 0.12,
                ),
                child: Container(
                  height: height(context) * 0.88,
                  width: width(context),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: width(context) * 0.05,
                          right: width(context) * 0.05,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Songs',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context)
                                      .pushNamed("most_popular");
                                });
                              },
                              child: Text(
                                'More',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 200,
                        width: width(context),
                        child: FutureBuilder(
                          future: audioQuery.getSongs(),
                          builder: (context, snapshot) {
                            List<Widget> songsWidget = [];
                            List<Widget> randomSongs = [];

                            songs = snapshot.data;

                            if (snapshot.data == null) {
                              return Center(
                                child: Text(
                                  'No Song found',
                                  style: TextStyle(color: Colors.white60),
                                ),
                              );
                            }
                            songs.forEach((element) {
                              songsWidget.add(SongCard(
                                albumInfo: element,
                              ));
                            });

                            for (int i = 0; i <= 3; i++) {
                              var randArt = getRandomElement(songsWidget);
                              randomSongs.add(randArt);
                            }

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: [...randomSongs],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width(context) * 0.05,
                          right: width(context) * 0.05,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Albums',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  musicModel.changeIndex(6);
                                });
                              },
                              child: Text(
                                'See All',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 200,
                        width: width(context),
                        child: FutureBuilder(
                          future: audioQuery.getAlbums(),
                          builder: (context, snapshot) {
                            List<Widget> albumWidget = [];
                            List<Widget> randomAlbum = [];

                            albums = snapshot.data;

                            if (snapshot.data == null) {
                              return Center(
                                child: Text(
                                    'No album found',
                                  style: TextStyle(
                                    color: Colors.white60
                                  ),
                                ),
                              );
                            }
                            albums.forEach((element) {
                              albumWidget.add(SongCard(
                                albumInfo: element,
                              ));
                            });

                            for (int i = 0; i <= 3; i++) {
                              var randArt = getRandomElement(albumWidget);
                              randomAlbum.add(randArt);
                            }

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: [...randomAlbum],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width(context) * 0.05,
                          right: width(context) * 0.05,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Playlists',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context)
                                      .pushNamed("most_popular");
                                });
                              },
                              child: Text(
                                'More',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 200,
                        width: width(context),
                        // child: FutureBuilder(
                        //   future: audioQuery.getPlaylists(),
                        //   builder: (context, snapshot) {
                        //     List<Widget> playListWidget = [];
                        //     List<Widget> randomPlaylist = [];
                        //
                        //     playlists = snapshot.data;
                        //
                        //     if (snapshot.data == null) {
                        //       return Center(
                        //         child: Text(
                        //           'No Playlist found',
                        //           style: TextStyle(color: Colors.white60),
                        //         ),
                        //       );
                        //     }
                        //     playlists.forEach((element) {
                        //       playListWidget.add(
                        //           SongCard(
                        //             playlistInfo: element,
                        //           )
                        //       );
                        //       print(element.name);
                        //     });
                        //
                        //     for(int i =0; i <= 3; i++) {
                        //       var randArt = getRandomElement(playListWidget);
                        //       randomPlaylist.add(randArt);
                        //     }
                        //
                        //     return ListView(
                        //       scrollDirection: Axis.horizontal,
                        //       children: [
                        //         ...playListWidget
                        //       ],
                        //     );
                        //   },
                        // ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SafeArea(
                  child: Container(
                    height: height(context) * 0.1,
                    width: width(context),
                    color: AppColor.darkThemeBackground,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            musicModel.changeIndex(2);
                          },
                        ),
                        Text(
                          'Most popular',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
