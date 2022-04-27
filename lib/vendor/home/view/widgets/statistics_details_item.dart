import 'package:flutter/material.dart';



class StatisticsDetailsItem extends StatelessWidget {
  const StatisticsDetailsItem({
    Key key,
    this.quantity,
    this.title,
  }) : super(key: key);
  final String title;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Text(
            quantity ?? '0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}