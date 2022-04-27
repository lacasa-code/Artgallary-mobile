import 'package:flutter/material.dart';

class WithdrawHistoryItem extends StatelessWidget {
  const WithdrawHistoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 7,
      ),
      child: ListTile(
        leading: Card(
          color: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          '-SR0.00',
        ),
        subtitle: Text(
          '21/04/2021 12:21',
        ),
      ),
    );
  }
}
