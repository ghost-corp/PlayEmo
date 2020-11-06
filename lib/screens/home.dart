import 'dart:math';

import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'package:playemo/widgets/artist_card.dart';
import 'package:playemo/widgets/category_card.dart';
import 'package:playemo/widgets/news_card.dart';
import 'package:playemo/widgets/song_card.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<ArtistInfo> artists;
  List<AlbumInfo> albums;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          backgroundColor: AppColor.darkThemeBackground,
          body: Stack(
            children: [
              Container(
                width: width(context),
                height: height(context),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 40,
                    left: width(context) * 0.05,
                    right: width(context) * 0.05),
                child: Container(
                  height: height(context) * 0.12,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Main',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: width(context) * 0.9,
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: Color(0xFF2F2C30),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white10,
                            ),
                            hintText: 'Search',
                            contentPadding: EdgeInsets.all(8),
                            hintStyle: TextStyle(color: Colors.white60),
                          ),
                          style: TextStyle(color: Colors.white60),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height(context) * 0.18,
                ),
                child: Container(
                  width: width(context),
                  height: height(context) * 0.82,
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
                              'Albums',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                        height: 220,
                        width: width(context),
                        child: FutureBuilder(
                          future: audioQuery.getAlbums(),
                          builder: (context, snapshot) {
                            List<Widget> albumWidget = [];
                            List<Widget> randomAlbum = [];

                            albums = snapshot.data;

                            if (snapshot.data == null) {
                              return Center(
                                child: Text('No artist found'),
                              );
                            }
                            albums.forEach((element) {
                              albumWidget.add(
                                  SongCard(
                                    albumInfo: element,
                                  )
                              );
                            });

                            for(int i =0; i <= 3; i++) {
                              var randArt = getRandomElement(albumWidget);
                              randomAlbum.add(randArt);
                            }

                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ...randomAlbum
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                              'Category',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: width(context),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CategoryCard(
                              imgPath: 'assets/pop.png',
                              categoryName: 'Pop',
                            ),
                            CategoryCard(
                              imgPath: 'assets/jazz.png',
                              categoryName: 'Jazz',
                            ),
                            CategoryCard(
                              imgPath: 'assets/rock.png',
                              categoryName: 'Rock',
                            ),
                            CategoryCard(
                              imgPath: 'assets/classic.png',
                              categoryName: 'Classic',
                            ),
                            CategoryCard(
                              imgPath: 'assets/blues.png',
                              categoryName: 'Blues',
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                              'Artists',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 120,
                        width: width(context),
                        child: FutureBuilder(
                          future: audioQuery.getArtists(),
                          builder: (context, snapshot) {
                            artists = snapshot.data;
                            List<Widget> artistWidget = [];
                            List<Widget> randomArtist = [];
                            if (snapshot.data == null) {
                              return Center(
                                child: Text('No artist found'),
                              );
                            }
                            artists.forEach((element) {
                              artistWidget.add(
                                ArtistCard(
                                  imgPath: null,
                                  artistName: element.name,
                                )
                              );
                            });

                            for(int i =0; i <= 3; i++) {
                              var randArt = getRandomElement(artistWidget);
                              randomArtist.add(randArt);
                            }
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: [...randomArtist],
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                              'News',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Text(
                              'More',
                              style: TextStyle(
                                  color: Colors.white60, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 220,
                        width: width(context),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            NewsCard(
                              imgPath: 'assets/news1.jpg',
                            ),
                            NewsCard(
                              imgPath: 'assets/news2.jpg',
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
