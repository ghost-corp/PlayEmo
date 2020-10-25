import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget {

  final String imgPath;

  const NewsCard({this.imgPath});

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200, width: 180,
        child: Image.asset(
          widget.imgPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
