import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ProductLowStockWarningView extends StatelessWidget {
  const ProductLowStockWarningView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterField(
      labelText: 'Quantity',
      initialValue: '1',
      keyboardType: TextInputType.phone,
      formatter: [
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
