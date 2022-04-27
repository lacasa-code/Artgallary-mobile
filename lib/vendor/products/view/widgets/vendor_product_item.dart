import 'package:flutter/material.dart';

class VendorProductItem extends StatelessWidget {
  const VendorProductItem({
    Key key,
    this.isDigitalProduct = false,
  }) : super(key: key);
  final bool isDigitalProduct;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Card(
        elevation: 4,
        color: Theme.of(context).colorScheme.secondary,
        shape: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.diamond,
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        'ProductName',
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category: Furniture',
          ),
          Visibility(
            visible: !isDigitalProduct,
            child: Text(
              'Current Qty: 21',
            ),
          ),
          Text(
            'Base Price: 122',
          ),
        ],
      ),
    );
  }
}
