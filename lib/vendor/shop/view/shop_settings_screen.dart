import 'dart:io';

import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/picked_image_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_button.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ShopSettingsScreen extends StatefulWidget {
  const ShopSettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  _ShopSettingsScreenState createState() => _ShopSettingsScreenState();
}

class _ShopSettingsScreenState extends State<ShopSettingsScreen>
    with SingleTickerProviderStateMixin {
  List<dynamic> pages = [
    {
      'title': 'Basic Info',
      'page': ShopInfoView(),
    },
    {
      'title': 'Banner Settings',
      'page': ShopBannersView(),
    },
    {
      'title': 'Social Media Link',
      'page': ShopSocialView(),
    },
  ];
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: pages.length, vsync: this);
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
                .toList()),
        title: Text(
          'Shop Settings',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: TabBarView(controller: _controller, children: [
        ...pages
            .map(
              (e) => e['page'],
            )
            .toList(),
      ]),
    );
  }
}

class ShopSocialView extends StatelessWidget {
  const ShopSocialView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RegisterField(
            keyboardType: TextInputType.url,
            helperText: 'Insert link with https',
            verticalPadding: 5.0,
            labelText: 'Facebook',
            suffixIcon: Icon(
              Icons.facebook,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          RegisterField(
            keyboardType: TextInputType.url,
            helperText: 'Insert link with https',
            verticalPadding: 5.0,
            labelText: 'Twitter',
            suffixIcon: Icon(
              FontAwesome.twitter,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          RegisterField(
            keyboardType: TextInputType.url,
            helperText: 'Insert link with https',
            verticalPadding: 5.0,
            labelText: 'Google',
            suffixIcon: Icon(
              FontAwesome.google,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          RegisterField(
            keyboardType: TextInputType.url,
            helperText: 'Insert link with https',
            verticalPadding: 5.0,
            labelText: 'Youtube',
            suffixIcon: Icon(
              FontAwesome.youtube,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RegisterButton(
            onPressed: () {},
            title: 'Save',
          ),
        ],
      ),
    );
  }
}

class ShopBannersView extends StatefulWidget {
  const ShopBannersView({
    Key key,
  }) : super(key: key);

  @override
  State<ShopBannersView> createState() => _ShopBannersViewState();
}

class _ShopBannersViewState extends State<ShopBannersView> {
  File pickedImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ShopInfoView(),
          PickedImageWidget(
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
            pickedImage: pickedImage,
            title: 'Banners (1500x450)',
          ),
          SizedBox(
            height: 10,
          ),
          RegisterButton(
            onPressed: () {},
            title: 'Save',
          ),
        ],
      ),
    );
  }
}

class ShopInfoView extends StatefulWidget {
  const ShopInfoView({
    Key key,
  }) : super(key: key);

  @override
  State<ShopInfoView> createState() => _ShopInfoViewState();
}

class _ShopInfoViewState extends State<ShopInfoView> {
  File pickedImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Shop Name',
          ),
          PickedImageWidget(
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
            pickedImage: pickedImage,
            title: 'Shop Logo',
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Shop Phone',
            keyboardType: TextInputType.phone,
            formatter: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Shop Address',
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Meta Title',
          ),
          RegisterField(
            verticalPadding: 5.0,
            labelText: 'Meta Description',
          ),
          SizedBox(
            height: 10,
          ),
          RegisterButton(
            onPressed: () {},
            title: 'Save',
          ),
        ],
      ),
    );
  }
}
