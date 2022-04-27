import 'dart:io';

import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/custom_image.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/image_picker_dialog.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/picked_image_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_button.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShopVerficationScreen extends StatefulWidget {
  const ShopVerficationScreen({
    Key key,
  }) : super(key: key);

  @override
  _ShopVerficationScreenState createState() => _ShopVerficationScreenState();
}

class _ShopVerficationScreenState extends State<ShopVerficationScreen> {
  File pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Shop Verfication',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterField(
              verticalPadding: 5.0,
              labelText: 'Your Name',
            ),
            RegisterField(
              verticalPadding: 5.0,
              labelText: 'Shop Name',
            ),
            RegisterField(
              verticalPadding: 5.0,
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            RegisterField(
              verticalPadding: 5.0,
              labelText: 'License No',
              keyboardType: TextInputType.emailAddress,
            ),
            RegisterField(
              verticalPadding: 5.0,
              labelText: 'Full Address',
              keyboardType: TextInputType.emailAddress,
            ),
            RegisterField(
              verticalPadding: 5.0,
              labelText: 'Phone Number',
              keyboardType: TextInputType.phone,
              formatter: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            PickedImageWidget(
              pickedImage: pickedImage,
              title: 'Tax Papers',
              onImagePicked: (file) {
                setState(() {
                  pickedImage = file;
                });
              },
              onRemoved: () {
                setState(() {
                  pickedImage = null;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            RegisterButton(
              onPressed: () {},
              title: 'Apply',
            ),
          ],
        ),
      ),
    );
  }
}
