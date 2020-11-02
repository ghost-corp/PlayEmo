import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'package:playemo/widgets/song_card.dart';

class MostPopularScreen extends StatefulWidget {
  @override
  _MostPopularScreenState createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {
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
                          'Albums',
                          style: TextStyle(
                              color: Colors.white, fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushNamed("most_popular");
                            });
                          },
                          child: Text(
                            'More',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 200,
                    width: width(context),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SongCard(
                          imgPath: 'assets/art1.jpg',
                          album: 'Free Me',
                          artist: 'Khal Drogo',
                        ),
                        SongCard(
                          imgPath: 'assets/art2.jpg',
                          album: 'Drogon!!!',
                          artist: 'Khaleesi',
                        ),
                        SongCard(
                          imgPath: 'assets/art3.jpg',
                          album: 'Night Watch',
                          artist: 'Jon Snow',
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
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
                              color: Colors.white, fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushNamed("most_popular");
                            });
                          },
                          child: Text(
                            'More',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 200,
                    width: width(context),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SongCard(
                          imgPath: 'assets/artist1.jpg',
                          album: 'Free Me',
                          artist: 'Khal Drogo',
                        ),
                        SongCard(
                          imgPath: 'assets/artist2.jpg',
                          album: 'Drogon!!!',
                          artist: 'Khaleesi',
                        ),
                        SongCard(
                          imgPath: 'assets/artist3.jpg',
                          album: 'Night Watch',
                          artist: 'Jon Snow',
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
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
                              color: Colors.white, fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              Navigator.of(context).pushNamed("most_popular");
                            });
                          },
                          child: Text(
                            'More',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 14
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 200,
                    width: width(context),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SongCard(
                          imgPath: 'assets/artist5.jpg',
                          album: 'Free Me',
                          artist: 'Khal Drogo',
                        ),
                        SongCard(
                          imgPath: 'assets/news1.jpg',
                          album: 'Drogon!!!',
                          artist: 'Khaleesi',
                        ),
                        SongCard(
                          imgPath: 'assets/news2.jpg',
                          album: 'Night Watch',
                          artist: 'Jon Snow',
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,)
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
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Most popular',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
                    Container(
                      height: 50, width: 50,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
