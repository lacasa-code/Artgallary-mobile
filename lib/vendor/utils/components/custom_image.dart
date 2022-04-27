import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomImage extends StatelessWidget {
  const CustomImage({
    Key key,
    @required this.pickedImage,
    @required this.onRemoved,
  }) : super(key: key);
  final File pickedImage;
  final void Function() onRemoved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.file(
              pickedImage,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          ),
          Positioned(
            top: -ScreenUtil().setHeight(10),
            right: -ScreenUtil().setHeight(5),
            left: -ScreenUtil().setHeight(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: onRemoved,
                  child: CircleAvatar(
                    radius: ScreenUtil().radius(15),
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}