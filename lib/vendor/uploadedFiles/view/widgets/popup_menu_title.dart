import 'package:flutter/material.dart';

class PopupMenuTitle extends StatelessWidget {
  const PopupMenuTitle({
    Key key,
    @required this.title,
    @required this.icons,
  }) : super(key: key);
  final String title;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icons),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
        ),
      ],
    );
  }
}
