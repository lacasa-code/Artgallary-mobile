import 'package:active_ecommerce_flutter/vendor/supportTickets/view/ticket_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        OneContext.instance.navigator.push(
          MaterialPageRoute(
            builder: (_) => TicketDetailsScreen(),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(
            'Ticket ID: #32398t7',
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sending Date: 21-05-2022',
              ),
              Row(
                children: [
                  Text(
                    'Status: ',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Chip(
                      label: Text(
                        'pending',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
