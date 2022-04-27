import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/add_new_digital_product_screen.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/add_new_product_screen.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/vendor_product_item.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/create_card_item.dart';
import 'package:flutter/material.dart';

class MyDigitalProductsScreen extends StatefulWidget {
  const MyDigitalProductsScreen({Key key}) : super(key: key);

  @override
  _MyDigitalProductsScreenState createState() =>
      _MyDigitalProductsScreenState();
}

class _MyDigitalProductsScreenState extends State<MyDigitalProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Digital Products',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: Column(
        children: [
          CreateCard(
            title: 'Add New Digital Product',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddNewDigitalProductScreen(),
                ),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  10,
                  (index) => VendorProductItem(
                    isDigitalProduct: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
