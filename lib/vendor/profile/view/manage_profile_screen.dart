import 'dart:io';

import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/picked_image_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_button.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/switch_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageProfileScreen extends StatefulWidget {
  const ManageProfileScreen({
    Key key,
    this.index = 0,
  }) : super(key: key);
  final int index;

  @override
  _ManageProfileScreenState createState() => _ManageProfileScreenState();
}

class _ManageProfileScreenState extends State<ManageProfileScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> pages = [
    {
      'title': 'Basic Info',
      'page': BasicInfoView(),
    },
    {
      'title': 'Payment Setting',
      'page': PaymentSettingsInfo(),
    },
    {
      'title': 'Change your email',
      'page': ChangeEmailView(),
    },
  ];

  TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: pages.length, vsync: this)
      ..index = widget.index;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        bottom: TabBar(
          labelColor: Colors.white,
          isScrollable: true,
          controller: _controller,
          tabs: pages
              .map(
                (e) => Text(
                  e['title'],
                ),
              )
              .toList(),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Manage Profile',
        ),
      ),
      body: TabBarView(controller: _controller, children: [
        ...pages
            .map(
              (e) => e['page'],
            )
            .toList(),
      ]),
      // body: ChangeEmailView(),
    );
  }
}

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Your Email',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          RegisterButton(
            onPressed: () {},
            title: 'Update Email',
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
        ],
      ),
    );
  }
}

class PaymentSettingsInfo extends StatefulWidget {
  const PaymentSettingsInfo({
    Key key,
  }) : super(key: key);

  @override
  State<PaymentSettingsInfo> createState() => _PaymentSettingsInfoState();
}

class _PaymentSettingsInfoState extends State<PaymentSettingsInfo> {
  var cashPayment = false;
  var bankPayment = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SwitchTileWidget(
            enabled: cashPayment,
            onChanged: (v) {
              setState(() {
                cashPayment = v;
              });
            },
            title: 'Cash Payment',
          ),
          SwitchTileWidget(
            enabled: bankPayment,
            onChanged: (v) {
              setState(() {
                bankPayment = v;
              });
            },
            title: 'Bank Payment',
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Bank Name',
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Bank Account Name',
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Bank Account Number',
            formatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Bank Routing Number',
            formatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          RegisterButton(
            onPressed: () {},
            title: 'Update Payment Settings',
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
        ],
      ),
    );
  }
}

class BasicInfoView extends StatefulWidget {
  const BasicInfoView({
    Key key,
  }) : super(key: key);

  @override
  State<BasicInfoView> createState() => _BasicInfoViewState();
}

class _BasicInfoViewState extends State<BasicInfoView> {
  File pickedImage;
  var passwordSecure = true;
  var passwordSecureConfirmation = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RegisterField(
            labelText: 'Your Name',
            verticalPadding: 5,
          ),
          RegisterField(
            labelText: 'Your Phone',
            verticalPadding: 5,
            keyboardType: TextInputType.phone,
            formatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          // PickedImageWidget(
          //   onImagePicked: (file) {
          //     setState(() {
          //       pickedImage = file;
          //     });
          //   },
          //   onRemoved: () {
          //     setState(() {
          //       pickedImage = null;
          //     });
          //   },
          //   pickedImage: pickedImage,
          //   title: 'Photo',
          // ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          RegisterButton(
            onPressed: () {},
            title: 'Update Profile',
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
          RegisterField(
            labelText: 'Your Password',
            verticalPadding: 5,
            obsecureText: true,
            // suffixIcon: IconButton(
            //   icon: Icon(
            //     passwordSecure ? Icons.visibility_off : Icons.visibility,
            //   ),
            //   onPressed: () {
            //     setState(() {
            //       passwordSecure = !passwordSecure;
            //     });
            //   },
            // ),
          ),
          RegisterField(
            labelText: 'Confirm Password',
            verticalPadding: 5,
            obsecureText: true,
            // suffixIcon: IconButton(
            //   icon: Icon(
            //     passwordSecureConfirmation
            //         ? Icons.visibility_off
            //         : Icons.visibility,
            //   ),
            //   onPressed: () {
            //     setState(() {
            //       passwordSecureConfirmation = !passwordSecureConfirmation;
            //     });
            //   },
            // ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
          RegisterButton(
            onPressed: () {},
            title: 'Update Password',
          ),
        ],
      ),
    );
  }
}
