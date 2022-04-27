import 'dart:io';

import 'package:active_ecommerce_flutter/vendor/utils/components/custom_image.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/image_picker_dialog.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';

class ProductMetaDataView extends StatefulWidget {
  const ProductMetaDataView({
    Key key,
  }) : super(key: key);

  @override
  _ProductMetaDataViewState createState() => _ProductMetaDataViewState();
}

class _ProductMetaDataViewState extends State<ProductMetaDataView> {
  File pickedMetaImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterField(
          labelText: 'Meta Title',
        ),
        SizedBox(
          height: 10,
        ),
        RegisterField(
          labelText: 'Description',
          maxLine: null,
        ),
        SizedBox(
          height: 10,
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
                  pickedMetaImage = file;
                });
              },
            );
          },
          child: RegisterField(
            enabled: false,
            labelText: 'Meta Image',
            suffixIcon: Icon(
              Icons.camera_alt_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        Visibility(
          visible: pickedMetaImage != null,
          child: CustomImage(
            pickedImage: pickedMetaImage,
            onRemoved: () {
              setState(() {
                pickedMetaImage = null;
              });
            },
          ),
        ),
      ],
    );
  }
}
