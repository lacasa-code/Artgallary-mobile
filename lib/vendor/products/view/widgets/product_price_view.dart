import 'package:active_ecommerce_flutter/vendor/utils/components/drop_down_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/helper/decimal_input_formatter.dart';
import 'package:date_range_picker_flutter/date_range_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductPriceView extends StatefulWidget {
  const ProductPriceView({
    Key key,
  }) : super(key: key);

  @override
  _ProductPriceViewState createState() => _ProductPriceViewState();
}

class _ProductPriceViewState extends State<ProductPriceView> {
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
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {
            var res = await showTCRDateRangePicker(
              context: context,
              selectRange: CustomDateTimeRange(),
              validRange: CustomDateTimeRange(
                start: DateTime.now(),
                end: DateTime.now().add(
                  const Duration(days: 365),
                ),
              ),
            );
            if (res == null) {
              return;
            }
            setState(() {
              dateController.text =
                  '${res.start.toString().substring(0, 10)} - ${res.end.toString().substring(0, 10)}';
            });
          },
          child: RegisterField(
            controller: dateController,
            labelText: 'Discount Date Range',
            enabled: false,
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
        RegisterField(
          labelText: 'Quantity',
          keyboardType: TextInputType.phone,
          formatter: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        SizedBox(
          height: 10,
        ),
        RegisterField(
          labelText: 'SKU',
        ),
        SizedBox(
          height: 10,
        ),
        RegisterField(
          labelText: 'External Link',
          helperText: 'Leave it blank if you do not use external site link',
        ),
      ],
    );
  }
}
