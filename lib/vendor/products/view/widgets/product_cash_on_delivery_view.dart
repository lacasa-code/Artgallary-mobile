import 'package:active_ecommerce_flutter/vendor/utils/components/switch_tile_widget.dart';
import 'package:flutter/material.dart';

class ProductCashOnDeliveryView extends StatefulWidget {
  const ProductCashOnDeliveryView({Key key}) : super(key: key);

  @override
  _ProductCashOnDeliveryViewState createState() =>
      _ProductCashOnDeliveryViewState();
}

class _ProductCashOnDeliveryViewState extends State<ProductCashOnDeliveryView> {
  var cashOnDelivery = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchTileWidget(
          enabled: cashOnDelivery,
          onChanged: (v) {
            setState(() {
              cashOnDelivery = v;
            });
          },
          title: 'Status',
        ),
      ],
    );
  }
}
