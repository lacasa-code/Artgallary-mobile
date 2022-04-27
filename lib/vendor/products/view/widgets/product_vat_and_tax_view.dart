import 'package:active_ecommerce_flutter/vendor/utils/components/drop_down_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/helper/decimal_input_formatter.dart';
import 'package:flutter/material.dart';

class ProductVatAndTaxView extends StatelessWidget {
  const ProductVatAndTaxView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: RegisterField(
                  removePadding: true,
                  labelText: 'Tax',
                  keyboardType: TextInputType.phone,
                  formatter: [
                    DecimalTextInputFormatter(
                      decimalRange: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: DropdownField(
                  validator: (v) {},
                  initialValue: 0,
                  labelText: 'Vat & TAX',
                  removePadding: true,
                  onChanged: (v) {},
                  items: ['Flat', 'Percent'],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
