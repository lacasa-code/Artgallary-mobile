import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/screens/address.dart';
import 'package:active_ecommerce_flutter/screens/wishlist.dart';
import 'package:active_ecommerce_flutter/vendor/commissions/view/commissions_screen.dart';
import 'package:active_ecommerce_flutter/vendor/coupon/view/vendor_coupon_screen.dart';
import 'package:active_ecommerce_flutter/vendor/home/view/widgets/page_profile_header_item.dart';
import 'package:active_ecommerce_flutter/vendor/orders/view/vendor_orders_screen.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/my_digital_product_screen.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/my_products_screen.dart';
import 'package:active_ecommerce_flutter/vendor/profile/view/manage_profile_screen.dart';
import 'package:active_ecommerce_flutter/vendor/purchase/view/purchase_history_screen.dart';
import 'package:active_ecommerce_flutter/vendor/reviews/view/product_reviews_screen.dart';
import 'package:active_ecommerce_flutter/vendor/settings/view/widgets/page_footer_item.dart';
import 'package:active_ecommerce_flutter/vendor/settings/view/widgets/settings_menu_item.dart';
import 'package:active_ecommerce_flutter/vendor/shop/view/shop_settings_screen.dart';
import 'package:active_ecommerce_flutter/vendor/supportTickets/view/support_ticket_screen.dart';
import 'package:active_ecommerce_flutter/vendor/uploadedFiles/view/uploaded_files_screen.dart';
import 'package:active_ecommerce_flutter/vendor/withdraw/view/money_withdraw_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:one_context/one_context.dart';

class VendorSettingsScreen extends StatefulWidget {
  const VendorSettingsScreen({
    Key key,
  }) : super(key: key);

  @override
  _VendorSettingsScreenState createState() => _VendorSettingsScreenState();
}

class _VendorSettingsScreenState extends State<VendorSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageProfileHeaderItem(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SettingsMenuItem(
                        title: 'Purchase History',
                        icons: Icons.list_alt_outlined,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PurchaseHistoryScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Downloads',
                        icons: Icons.download,
                        onTap: () {},
                      ),
                      SettingsMenuItem(
                        title: 'Wishlist',
                        icons: Icons.favorite_border,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Wishlist(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Compare',
                        icons: Icons.flip_camera_android,
                        onTap: () {},
                      ),
                      SettingsMenuItem(
                        title: 'Products',
                        icons: Icons.diamond_outlined,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MyProductsScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Digital Products',
                        icons: Icons.diamond_outlined,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MyDigitalProductsScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Uploaded Files',
                        icons: Icons.upload,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => UploadedFilesScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Coupon',
                        icons: Icons.discount_outlined,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => VendorCouponScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Orders',
                        icons: FontAwesome.money,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => VendorOrdersScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Products Reviews',
                        icons: Icons.star_half_outlined,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => ProductReviewsScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Shop Settings',
                        icons: Icons.settings_outlined,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => ShopSettingsScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Addrss',
                        icons: Icons.location_on,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => Address(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Payment History',
                        icons: Icons.history,
                        onTap: () {},
                      ),
                      SettingsMenuItem(
                        title: 'Money Withdraw',
                        icons: FontAwesome5.money_bill_alt,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => MoneyWithdrawScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Commission History',
                        icons: Icons.list_alt,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => CommissionsScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Conversations',
                        icons: Icons.chat,
                        onTap: () {},
                      ),
                      SettingsMenuItem(
                        title: 'Support Tickets',
                        icons: Icons.settings_outlined,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => SupportTicketScreen(),
                            ),
                          );
                        },
                      ),
                      SettingsMenuItem(
                        title: 'Manage Profile',
                        icons: Icons.person_outline,
                        onTap: () {
                          OneContext.instance.navigator.push(
                            MaterialPageRoute(
                              builder: (_) => ManageProfileScreen(),
                            ),
                          );
                        },
                      ),
                      Divider(
                        thickness: 1.4,
                      ),
                    ],
                  ),
                  PageFooterItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
