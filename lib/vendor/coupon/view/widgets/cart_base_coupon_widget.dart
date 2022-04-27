import 'package:active_ecommerce_flutter/vendor/utils/components/drop_down_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/searchable_dropdown_widget.dart';
import 'package:date_range_picker_flutter/date_range_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartBaseCouponWidget extends StatefulWidget {
  const CartBaseCouponWidget({
    Key key,
  }) : super(key: key);

  @override
  State<CartBaseCouponWidget> createState() => _CartBaseCouponWidgetState();
}

class _CartBaseCouponWidgetState extends State<CartBaseCouponWidget> {
  var from = DateTime.now();
  var to = DateTime.now();
  var dateController = TextEditingController();
  @override
  void initState() {
    dateController.text =
        '${from.toString().substring(0, 10)} - ${to.toString().substring(0, 10)}';
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              'Add Your Cart Base Coupon',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          RegisterField(
            removePadding: true,
            labelText: 'Coupon Code',
          ),
          SizedBox(
            height: 10,
          ),
          RegisterField(
            removePadding: true,
            labelText: 'Maximum Shopping',
            formatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: RegisterField(
                  removePadding: true,
                  hintText: 'Discount',
                  keyboardType: TextInputType.phone,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: DropdownField(
                  validator: (v) {},
                  initialValue: 0,
                  hintText: 'Select One',
                  removePadding: true,
                  onChanged: (v) {},
                  items: ['Amount', 'Percent'],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          RegisterField(
            removePadding: true,
            labelText: 'Maximum Discount Amount',
            formatter: [
              FilteringTextInputFormatter.digitsOnly,
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
              // setState(() {
              //   from = res.start;
              //   to = res.end;
              //   dateController.text =
              //       '${from.toString().substring(0, 10)} - ${to.toString().substring(0, 10)}';
              // });
            },
            child: RegisterField(
              controller: dateController,
              removePadding: true,
              hintText: 'Date',
              enabled: false,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
