import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/orders/view/order_details_screen.dart';
import 'package:active_ecommerce_flutter/vendor/orders/view/widgets/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class VendorOrdersScreen extends StatefulWidget {
  const VendorOrdersScreen({
    Key key,
  }) : super(key: key);

  @override
  _VendorOrdersScreenState createState() => _VendorOrdersScreenState();
}

class _VendorOrdersScreenState extends State<VendorOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Orders',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            10,
            (index) => OrderWidget(
              onPressed: () {
                OneContext.instance.navigator.push(
                  MaterialPageRoute(
                    builder: (_) => OrderDetailsScreen(),
                  ),
                );
              },
              deliveryStatus: 'Pending',
              amount: 'SR32.00',
              customerName: 'user_name',
              imageUrl: 'imageUrl',
              orderId: '#20220426-19590734',
            ),
          ),
        ),
      ),
    );
  }
}
