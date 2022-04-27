import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter/material.dart';
import './widgets/ticket_card.dart';

class SupportTicketScreen extends StatefulWidget {
  const SupportTicketScreen({
    Key key,
  }) : super(key: key);

  @override
  _SupportTicketScreenState createState() => _SupportTicketScreenState();
}

class _SupportTicketScreenState extends State<SupportTicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Support Tickets',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => TicketCard(),
          ),
        ),
      ),
    );
  }
}
