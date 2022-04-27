import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/coupon/view/add_new_coupon_screen.dart';
import 'package:active_ecommerce_flutter/vendor/coupon/view/widgets/coupon_item.dart';
import 'package:flutter/material.dart';

class VendorCouponScreen extends StatefulWidget {
  const VendorCouponScreen({Key key}) : super(key: key);

  @override
  _VendorCouponScreenState createState() => _VendorCouponScreenState();
}

class _VendorCouponScreenState extends State<VendorCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Coupon',
        ),
      ),
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (c) => AddNewCouponScreen(),
                ),
              );
            },
            child: Text(
              'Add New Coupon',
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  10,
                  (index) => CouponItem(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
