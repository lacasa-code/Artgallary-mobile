import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/home/view/widgets/page_profile_header_item.dart';
import 'package:active_ecommerce_flutter/vendor/home/view/widgets/settings_card.dart';
import 'package:active_ecommerce_flutter/vendor/home/view/widgets/statistics_view.dart';
import 'package:active_ecommerce_flutter/vendor/home/view/widgets/total_view.dart';
import 'package:active_ecommerce_flutter/vendor/home/view/widgets/verfication_card.dart';
import 'package:active_ecommerce_flutter/vendor/shop/view/shop_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class VendorHomeScreen extends StatefulWidget {
  const VendorHomeScreen({Key key}) : super(key: key);

  @override
  _VendorHomeScreenState createState() => _VendorHomeScreenState();
}

class _VendorHomeScreenState extends State<VendorHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageProfileHeaderItem(),
            TotalView(),
            StatisticsView(),
            VerficationView(),
            SettingsCard(
              title: 'Shop',
              subTitle: 'Manage & organize your shop',
              buttonText: 'Go to Settings',
              onPressed: () {
                OneContext.instance.navigator.push(
                  MaterialPageRoute(
                    builder: (_) => ShopSettingsScreen(),
                  ),
                );
              },
            ),
            SettingsCard(
              title: 'Payment',
              subTitle: 'Configure your payment method',
              buttonText: 'Configure Now',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
