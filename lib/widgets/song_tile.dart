import 'package:flutter/material.dart';
import 'package:playemo/global/app_color.dart';
import 'package:playemo/global/device_size.dart';

class SongTile extends StatefulWidget {

  final String song;
  final String artist;
  final String duration;

  const SongTile({this.artist, this.duration, this.song});

  @override
  _SongTileState createState() => _SongTileState();
}

class _SongTileState extends State<SongTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: Colors.white12,
        ),
        Container(
          width: width(context),
          height: 60,
          child: Padding(
            padding: EdgeInsets.only(
              left: width(context) * 0.05,
              right: width(context) * 0.05,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 30, width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColor.primary,
                          style: BorderStyle.solid,
                          width: 2
                        )
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow_sharp,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.song.length < 25 ?
                          widget.song : widget.song.substring(0, 25) + '...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          widget.artist.length < 30 ?
                          widget.artist : widget.artist.substring(0, 30) + '...',
                          style: TextStyle(
                            color: Colors.white38,
                            fontSize: 14
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '${printDuration(widget.duration)}',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        size: 28,
                        color: Colors.white38,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  String printDuration(String songDuration) {
    Duration duration;
    int seconds;
    seconds = int.tryParse(songDuration);
    duration = Duration(milliseconds: seconds);

    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitsMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitsMinutes:$twoDigitSeconds";
  }
}
