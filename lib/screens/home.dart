import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'package:playemo/widgets/artist_card.dart';
import 'package:playemo/widgets/category_card.dart';
import 'package:playemo/widgets/news_card.dart';
import 'package:playemo/widgets/song_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              padding:  EdgeInsets.only(
                top: 40,
                left: width(context) * 0.05, right: width(context) * 0.05
              ),
              child: Container(
                height: height(context) * 0.12,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Main',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: width(context) * 0.9,
                      height: 45,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor: Color(0xFF2F2C30),
                            prefixIcon: Icon(
                              Icons.search, color: Colors.white10,
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
                            'Most popular',
                            style: TextStyle(
                              color: Colors.white, fontSize: 16
                            ),
                          ),
                          Text(
                            'More',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 14
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
                    SizedBox(height: 20,),
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
                            style: TextStyle(
                                color: Colors.white, fontSize: 16
                            ),
                          ),
                          Text(
                            'More',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 14
                            ),
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
                    SizedBox(height: 20,),
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
                            style: TextStyle(
                                color: Colors.white, fontSize: 16
                            ),
                          ),
                          Text(
                            'More',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 14
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 90,
                      width: width(context),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ArtistCard(
                            imgPath: 'assets/artist1.jpg',
                          ),
                          ArtistCard(
                            imgPath: 'assets/artist2.jpg',
                          ),
                          ArtistCard(
                            imgPath: 'assets/artist3.jpg',
                          ),
                          ArtistCard(
                            imgPath: 'assets/artist4.jpg',
                          ),
                          ArtistCard(
                            imgPath: 'assets/artist5.jpg',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
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
                            style: TextStyle(
                                color: Colors.white, fontSize: 16
                            ),
                          ),
                          Text(
                            'More',
                            style: TextStyle(
                                color: Colors.white60, fontSize: 14
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 220, width: width(context),
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
        )
      ),
    );
  }
}
