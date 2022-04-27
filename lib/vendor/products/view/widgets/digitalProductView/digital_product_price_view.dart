import 'package:active_ecommerce_flutter/vendor/utils/components/drop_down_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/helper/decimal_input_formatter.dart';
import 'package:date_range_picker_flutter/date_range_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DigitalProductPriceView extends StatefulWidget {
  const DigitalProductPriceView({
    Key key,
  }) : super(key: key);

  @override
  _DigitalProductPriceViewState createState() => _DigitalProductPriceViewState();
}

class _DigitalProductPriceViewState extends State<DigitalProductPriceView> {
  var dateController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterField(
          labelText: 'Unit Price',
          keyboardType: TextInputType.phone,
          formatter: [
            DecimalTextInputFormatter(
              decimalRange: 3,
            ),
          ],
        ),
        RegisterField(
          labelText: 'Purchase Price',
          keyboardType: TextInputType.phone,
          formatter: [
            DecimalTextInputFormatter(
              decimalRange: 3,
            ),
          ],
        ),
     
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
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
                  labelText: 'Select One',
                  removePadding: true,
                  onChanged: (v) {},
                  items: ['Flat', 'Percent'],
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: RegisterField(
                  removePadding: true,
                  labelText: 'Discount',
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
                  labelText: 'Select One',
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
