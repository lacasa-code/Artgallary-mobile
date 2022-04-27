import 'package:flutter/material.dart';
import './statistics_details_item.dart';



class StatisticsView extends StatelessWidget {
  const StatisticsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Orders',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Divider(
            thickness: 1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                StatisticsDetailsItem(
                  title: 'Total Orders:',
                ),
                Divider(
                  thickness: 1.5,
                ),
                StatisticsDetailsItem(
                  title: 'Pending Orders:',
                ),
                Divider(
                  thickness: 1.5,
                ),
                StatisticsDetailsItem(
                  title: 'Canceled Orders:',
                ),
                Divider(
                  thickness: 1.5,
                ),
                StatisticsDetailsItem(
                  title: 'Successful Orders:',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}