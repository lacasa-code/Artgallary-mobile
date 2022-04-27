import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/coupon/view/widgets/cart_base_coupon_widget.dart';
import 'package:active_ecommerce_flutter/vendor/coupon/view/widgets/product_base_coupon_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/drop_down_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_button.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/searchable_dropdown_widget.dart';
import 'package:date_range_picker_flutter/date_range_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewCouponScreen extends StatefulWidget {
  const AddNewCouponScreen({
    Key key,
    this.isEdit = false,
  }) : super(key: key);
  final bool isEdit;

  @override
  _AddNewCouponScreenState createState() => _AddNewCouponScreenState();
}

class _AddNewCouponScreenState extends State<AddNewCouponScreen> {
  /// 1 => product base , 2 => cart base
  var seletedType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          widget.isEdit ? 'Edit Coupon' : 'Add New Coupon',
        ),
      ),
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Coupon Information Adding',
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
            DropdownField(
              hintText: 'Type',
              items: [
                'Select One',
                'For Products',
                'For Total Orders',
              ],
              onChanged: (v) {
                if (v == null) {
                  return;
                }
                setState(() {
                  seletedType = v;
                });
              },
              validator: (v) {},
            ),
            seletedType == 1
                ? ProductBaseCouponWidget()
                : seletedType == 2
                    ? CartBaseCouponWidget()
                    : SizedBox(),
            SizedBox(
              height: 20,
            ),
            RegisterButton(
              onPressed: () {},
              title: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
