import 'package:flutter/material.dart';

import '../../../utils/helper/media_query.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key key,
    @required this.onPressed,
    @required this.deliveryStatus,
    @required this.customerName,
    @required this.imageUrl,
    @required this.orderId,
    @required this.amount,
  }) : super(key: key);
  final void Function() onPressed;
  final String imageUrl;
  final String orderId;
  final String customerName;
  final String deliveryStatus;
  final String amount;

  @override
  Widget build(BuildContext context) {
    bool isImageAvailable = true;
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            // leading: ClipRRect(
            //   borderRadius: BorderRadius.circular(20),
            //   child: Image.asset(
            //     'assets/images/food1.jpg',
            //   ),
            // ),
            leading: StatefulBuilder(builder: (context, setState) {
              return Container(
                width: context.width * 0.16,
                // height: context.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  image: DecorationImage(
                    image: isImageAvailable
                        ? NetworkImage(
                            imageUrl,
                          )
                        : AssetImage('assets/order.png'),
                    onError: (_, __) {
                      setState(() {
                        isImageAvailable = false;
                      });
                    },
                    fit: isImageAvailable ? BoxFit.cover : BoxFit.contain,
                  ),
                ),
              );
            }),
            title: Text(
              orderId,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Customer Name: $customerName',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Status: $deliveryStatus',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'amount: $amount',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
