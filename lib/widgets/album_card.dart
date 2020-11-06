import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:playemo/screens/song_screen.dart';

class AlbumCard extends StatefulWidget {

  final AlbumInfo albumInfo;
  final String description;

  const AlbumCard({this.albumInfo, this.description});

  @override
  _AlbumCardState createState() => _AlbumCardState();
}

class _AlbumCardState extends State<AlbumCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => SongScreen(albumInfo: widget.albumInfo)
              )
          );
        },
        child: Container(
          height: 220,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            children: [
              Container(
                height: 220, width: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Hero(
                    tag: widget.albumInfo.id,
                    child: widget.albumInfo.albumArt == null ?
                    Image.asset(
                      'assets/no_cover.png',
                      fit: BoxFit.fill,
                    ) : Image.file(
                      File(widget.albumInfo.albumArt),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18)
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 180, height: 50,
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
                        widget.albumInfo.title.length < 15 ?
                        widget.albumInfo.title : widget.albumInfo.title.substring(0, 15) + '...',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14
                        ),
                      ),
                      Text(
                        widget.albumInfo.artist.length < 15 ?
                        widget.albumInfo.artist : widget.albumInfo.artist.substring(0, 15) + '...',
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
