import 'package:flutter/material.dart';

class CommissionDetailsText extends StatelessWidget {
  const CommissionDetailsText({
    Key key,
    @required this.title,
    @required this.desc,
  }) : super(key: key);
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: title ?? '',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
          ),
          TextSpan(
            text: desc ?? '',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 15,
                ),
          ),
        ]),
      ),
    );
  }
}
