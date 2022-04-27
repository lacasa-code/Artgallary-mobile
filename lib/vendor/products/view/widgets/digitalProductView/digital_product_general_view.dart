import 'dart:io';

import 'package:active_ecommerce_flutter/vendor/products/view/widgets/text_field_tag_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/custom_image.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/image_picker_dialog.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/searchable_dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DigitalProductInformationWidget extends StatefulWidget {
  const DigitalProductInformationWidget({
    Key key,
  }) : super(key: key);

  @override
  State<DigitalProductInformationWidget> createState() =>
      _DigitalProductInformationWidgetState();
}

class _DigitalProductInformationWidgetState
    extends State<DigitalProductInformationWidget> {
  File pickedProductImage;
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
          InkWell(
            onTap: () async {
              ImagePickerDialog().show(
                context: context,
                onGet: (file) {
                  if (file == null) {
                    return;
                  }
                  setState(() {
                    pickedProductImage = file;
                  });
                },
              );
            },
            child: RegisterField(
              enabled: false,
              labelText: 'Product Image',
              suffixIcon: Icon(
                Icons.camera_alt_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          Visibility(
            visible: pickedProductImage != null,
            child: CustomImage(
              pickedImage: pickedProductImage,
              onRemoved: () {
                setState(() {
                  pickedProductImage = null;
                });
              },
            ),
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
