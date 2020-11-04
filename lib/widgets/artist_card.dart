import 'dart:io';

import 'package:flutter/material.dart';

class ArtistCard extends StatefulWidget {

  final List<int> imgPath;
  final String file;
  final String artistName;

  const ArtistCard({this.imgPath, this.file, this.artistName});

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  @override
  Widget build(BuildContext context) {

    final hasImage = !(widget.imgPath == null || widget.imgPath.isEmpty);

    return Padding(
      padding: EdgeInsets.only(
        left: 8, right: 8, top: 10
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50, width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: (widget.file == null && !hasImage)
                  ? Image.asset(
                'assets/person.png',
                fit: BoxFit.fill,
              ) : (hasImage)
                  ? Image.memory(
                widget.imgPath,
                fit: BoxFit.fill,
              ) : Image.file(
                File(widget.file),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            width: 100,
            child: Text(
              widget.artistName.length < 15 ?
              widget.artistName : widget.artistName.substring(0, 15) + '...',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
          )
        ],
      ),
    );
  }
}
