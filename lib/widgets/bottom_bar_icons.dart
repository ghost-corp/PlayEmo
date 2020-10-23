import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:playemo/global/app_color.dart';

class BottomBarIcon extends StatefulWidget {

  final VoidCallback onTap;
  final IconData iconData;
  final String label;
  final bool selected;

  const BottomBarIcon({this.iconData, this.label, this.selected, this.onTap});

  @override
  _BottomBarIconState createState() => _BottomBarIconState();
}

class _BottomBarIconState extends State<BottomBarIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.widget.onTap,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.selected ? ShaderMask(
              child: Icon(
                widget.iconData,
              ),
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return ui.Gradient.linear(
                    Offset(4, 24),
                    Offset(24, 4),
                    [AppColor.primary, AppColor.primary1]
                );
              },
            ) : Icon(
              widget.iconData, color: Colors.white,
            ),
            widget.selected ? ShaderMask(
              child: Text(
                widget.label,
              ),
              blendMode: BlendMode.srcIn,
              shaderCallback: (Rect bounds) {
                return ui.Gradient.linear(
                    Offset(4, 24),
                    Offset(24, 4),
                    [AppColor.primary, AppColor.primary1]
                );
              },
            ) : Text(
              widget.label,
              style: TextStyle(color: Colors.white54),
            )
          ],
        ),
      ),
    );
  }
}
