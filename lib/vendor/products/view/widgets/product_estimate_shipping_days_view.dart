import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class ProductEstimateShippingDaysView extends StatelessWidget {
  const ProductEstimateShippingDaysView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RegisterField(
      labelText: 'Shipping Days',
      hintText: 'Shipping Days',
      keyboardType: TextInputType.phone,
      formatter: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      suffixIcon: Container(
        decoration: BoxDecoration(
          color: MyTheme.white,
          // borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   width: 0.5,
          // ),
        ),
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Days',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
