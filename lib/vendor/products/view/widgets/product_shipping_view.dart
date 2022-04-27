import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/switch_tile_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/helper/decimal_input_formatter.dart';
import 'package:flutter/material.dart';

class ProductShippingView extends StatefulWidget {
  const ProductShippingView({Key key}) : super(key: key);

  @override
  _ProductShippingViewState createState() => _ProductShippingViewState();
}

class _ProductShippingViewState extends State<ProductShippingView> {
  var freeShiping = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchTileWidget(
          enabled: freeShiping,
          onChanged: (v) {
            if (freeShiping) {
              return;
            }
            setState(() {
              freeShiping = !freeShiping;
            });
          },
          title: 'Free Shipping',
        ),
        SwitchTileWidget(
          enabled: !freeShiping,
          onChanged: (v) {
            if (!freeShiping) {
              return;
            }
            setState(() {
              freeShiping = !freeShiping;
            });
          },
          title: 'Flat Rate',
        ),
        if (!freeShiping) ...[
          SizedBox(
            height: 10,
          ),
          RegisterField(
            labelText: 'Shipping cost',
            keyboardType: TextInputType.phone,
            formatter: [
              DecimalTextInputFormatter(
                decimalRange: 2,
              ),
            ],
          )
        ],
      ],
    );
  }
}
