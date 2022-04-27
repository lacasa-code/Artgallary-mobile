import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';


class ProductDescriptionView extends StatelessWidget {
  const ProductDescriptionView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterField(
      labelText: 'Description',
      maxLine: null,
    );
  }
}
