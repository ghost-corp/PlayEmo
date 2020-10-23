import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
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
                top: 60,
                left: width(context) * 0.05, right: width(context) * 0.05
              ),
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
                  SizedBox(height: 20,),
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
            Padding(
              padding: EdgeInsets.only(
                top: height(context) * 0.2
              ),
              child: Container(
                width: width(context),
                height: height(context) * 0.8,
                child: ListView(
                  children: [
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
