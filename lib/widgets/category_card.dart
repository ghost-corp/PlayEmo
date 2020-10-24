import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:playemo/global/app_color.dart';

class CategoryCard extends StatefulWidget {

  final String imgPath;
  final String categoryName;

  const CategoryCard({this.imgPath, this.categoryName});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10, bottom: 10
      ),
      child: Container(
        height: 150,
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80, width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white10,
                    width: 1
                ),
                borderRadius: BorderRadius.circular(18)
              ),
              padding: EdgeInsets.all(8),
              child: ShaderMask(
                child: Image.asset(
                  widget.imgPath,
                  fit: BoxFit.fill,
                ),
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return ui.Gradient.linear(
                      Offset(4, 24),
                      Offset(24, 4),
                      [AppColor.primary, AppColor.primary1]
                  );
                },
              ),
            ),
            SizedBox(height: 10,),
            Text(
              widget.categoryName,
              style: TextStyle(
                color: Colors.white
              ),
            )
          ],
        ),
      ),
    );
  }
}
