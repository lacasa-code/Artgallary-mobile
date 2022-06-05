import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/commissions/view/widgets/commission_details_text.dart';
import 'package:flutter/material.dart';

class CommissionsScreen extends StatefulWidget {
  const CommissionsScreen({
    Key key,
  }) : super(key: key);

  @override
  _CommissionsScreenState createState() => _CommissionsScreenState();
}

class _CommissionsScreenState extends State<CommissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Commission History',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              10,
              (index) => CommissionCard(),
            )
          ],
        ),
      ),
    );
  }
}

class CommissionCard extends StatelessWidget {
  const CommissionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CommissionDetailsText(
              title: 'Order Code: ',
              desc: '20220426-19590734',
            ),
            CommissionDetailsText(
              title: 'Admin Commission: ',
              desc: '0.0',
            ),
            CommissionDetailsText(
              title: 'Seller Earning: ',
              desc: '90.00',
            ),
          ],
        ),
      ),
    );
  }
}
