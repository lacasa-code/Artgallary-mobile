import 'package:active_ecommerce_flutter/vendor/products/view/widgets/text_field_tag_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/searchable_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInformationWidget extends StatelessWidget {
  const ProductInformationWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          RegisterField(
            labelText: 'Product Name',
          ),
          SearchableDropDownWidget(
            values: [
              'Paint Art',
              'Furniture',
            ],
            thinBorder: true,
            labelText: 'Category',
            onChanged: (v) {},
          ),
          SearchableDropDownWidget(
            values: [
              'Select Brand',
              'Demo Brand',
              'Demo Brand1',
            ],
            labelText: 'Brand',
            thinBorder: true,
            onChanged: (v) {},
          ),
          RegisterField(
            hintText: 'Unit (e.g. KG, PC etc)',
            labelText: 'Unit Price',
          ),
          SizedBox(
            height: 10,
          ),
          RegisterField(
            labelText: 'Minimum Purchase Qty',
            initialValue: '1',
            enabled: false,
          ),
          SizedBox(
            height: 10,
          ),
          TextFieldTag(),
          SizedBox(
            height: ScreenUtil().setHeight(100),
          ),
        ],
      ),
    );
  }
}
