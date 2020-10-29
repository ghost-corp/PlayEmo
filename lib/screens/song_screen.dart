import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';
import 'dart:ui' as ui;

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
              left: 30,
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
