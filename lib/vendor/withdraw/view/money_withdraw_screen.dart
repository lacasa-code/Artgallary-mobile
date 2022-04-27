import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/withdraw/view/widgets/page_header_widget.dart';
import 'package:active_ecommerce_flutter/vendor/withdraw/view/widgets/withdraw_history_item.dart';
import 'package:flutter/material.dart';

class MoneyWithdrawScreen extends StatefulWidget {
  const MoneyWithdrawScreen({
    Key key,
  }) : super(key: key);

  @override
  _MoneyWithdrawScreenState createState() => _MoneyWithdrawScreenState();
}

class _MoneyWithdrawScreenState extends State<MoneyWithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Money Withdraw',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PageHeaderWidget(),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Withdraw Request history',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            ...List.generate(
              10,
              (index) => WithdrawHistoryItem(),
            )
          ],
        ),
      ),
    );
  }
}
