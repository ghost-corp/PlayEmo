import 'package:flutter/material.dart';

class ArtistCard extends StatefulWidget {

  final String imgPath;

  const ArtistCard({this.imgPath});

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(),
      child: Container(
        height: 70, width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: Image.asset(
            widget.imgPath,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
