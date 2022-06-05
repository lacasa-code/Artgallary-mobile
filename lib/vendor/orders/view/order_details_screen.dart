import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/drop_down_field.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    Key key,
  }) : super(key: key);

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Order Details',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ChangeOrderStatusView(),
            OrderSummaryInfo(),
            OrderAmountView(),
            OrderDetailsView(),
          ],
        ),
      ),
    );
  }
}

class OrderAmountView extends StatelessWidget {
  const OrderAmountView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.2,
                )),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              'Order Details:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.2,
                )),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                ListTile(
                  leading: Text('1x'),
                  title: Text(
                    'Product Name',
                  ),
                  subtitle: Text(
                    'Delivery Type: Home Delivery',
                  ),
                  trailing: Text(
                    'SR90.00',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.2,
                )),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              'Order Ammount:',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.2,
                )),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                OrderDetailsItem(
                  title: 'Order Code:',
                  quantity: '20220426-19590734',
                ),
                OrderDetailsItem(
                  title: 'Customer:',
                  quantity: 'customer_name',
                ),
                OrderDetailsItem(
                  title: 'Email:',
                  quantity: 'email@company.com',
                ),
                OrderDetailsItem(
                  title: 'Subtotal',
                  quantity: 'SR90.00',
                ),
                OrderDetailsItem(
                  title: 'Shipping',
                  quantity: 'SR0.00',
                ),
                OrderDetailsItem(
                  title: 'Tax',
                  quantity: 'SR0.00',
                ),
                OrderDetailsItem(
                  title: 'Coupon',
                  quantity: 'SR90.00',
                ),
                OrderDetailsItem(
                  title: 'Total',
                  quantity: 'SR90.00',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSummaryInfo extends StatelessWidget {
  const OrderSummaryInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.2,
                )),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(
              'Orders Summary :',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0.2,
                )),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              children: [
                OrderDetailsItem(
                  title: 'Order Code:',
                  quantity: '20220426-19590734',
                ),
                OrderDetailsItem(
                  title: 'Customer:',
                  quantity: 'customer_name',
                ),
                OrderDetailsItem(
                  title: 'Email:',
                  quantity: 'email@company.com',
                ),
                OrderDetailsItem(
                  title: 'Shipping address:',
                  quantity: 'address,test,',
                ),
                OrderDetailsItem(
                  title: 'Order Date:',
                  quantity: '20220426-19590734',
                ),
                OrderDetailsItem(
                  title: 'Order Status:',
                  quantity: 'Delivered',
                ),
                OrderDetailsItem(
                  title: 'Total order amount:',
                  quantity: 'SR90.00',
                ),
                OrderDetailsItem(
                  title: 'Contact:',
                  quantity: '1231231233',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({
    Key key,
    @required this.title,
    @required this.quantity,
  }) : super(key: key);
  final String title;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          Text(
            quantity,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

class ChangeOrderStatusView extends StatelessWidget {
  const ChangeOrderStatusView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            children: [
              Text(
                'Delivery Status: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Expanded(
                child: DropdownField(
                  items: [
                    'Confirmed',
                    'Picked Up',
                    'On The Way',
                    'Delivered',
                    'Cancel',
                  ],
                  onChanged: (v) {},
                  validator: (v) {},
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            children: [
              Text(
                'Payment Status: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Expanded(
                child: DropdownField(
                  items: [
                    'Paid',
                    'UN-Paid',
                  ],
                  onChanged: (v) {},
                  validator: (v) {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
