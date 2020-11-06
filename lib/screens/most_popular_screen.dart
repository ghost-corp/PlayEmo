import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'package:playemo/widgets/album_card.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'dart:math';

class MostPopularScreen extends StatefulWidget {
  @override
  _MostPopularScreenState createState() => _MostPopularScreenState();
}

class _MostPopularScreenState extends State<MostPopularScreen> {

  final FlutterAudioQuery audioQuery = FlutterAudioQuery();
  List<AlbumInfo> albums;
  List<SongInfo> songs;

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
                        AlbumCard(
                          albumInfo: element,
                        )
                    );
                  });

                  for(int i =0; i <= 3; i++) {
                    var randArt = getRandomElement(albumWidget);
                    randomAlbum.add(randArt);
                  }

                  return ListView(
                    children: [
                      Wrap(
                        children: [
                          ...albumWidget
                        ],
                      )
                    ],
                  );
                },
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
                      'Albums',
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

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
