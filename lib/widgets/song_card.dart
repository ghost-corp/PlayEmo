import 'package:flutter/material.dart';

class SongCard extends StatefulWidget {

  final String imgPath;
  final String artist;
  final String album;

  const SongCard({this.album, this.artist, this.imgPath});

  @override
  _SongCardState createState() => _SongCardState();
}

class _SongCardState extends State<SongCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            Container(
              height: 200, width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  widget.imgPath,
                  fit: BoxFit.fill,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18)
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 150, height: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(18),
                    bottomLeft: Radius.circular(18),
                  ),
                  color: Colors.grey.withOpacity(0.2)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.album,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Text(
                      widget.artist,
                      style: TextStyle(
                        color: Colors.white60
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
