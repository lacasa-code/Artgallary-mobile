import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/add_new_product_screen.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/vendor_product_item.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/create_card_item.dart';
import 'package:flutter/material.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({Key key}) : super(key: key);

  @override
  _MyProductsScreenState createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Products',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: Column(
        children: [
          CreateCard(
            title: 'Add New Product',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddNewProductScreen(),
                ),
              );
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  10,
                  (index) => VendorProductItem(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
