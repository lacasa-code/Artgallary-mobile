import 'package:active_ecommerce_flutter/vendor/home/view/vendor_home_screen.dart';
import 'package:active_ecommerce_flutter/vendor/settings/view/settings_screen.dart';
import 'package:active_ecommerce_flutter/vendor/tab/viewModel/tab_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> pages = [];
  @override
  void initState() {
    pages = [
      VendorHomeScreen(),
      VendorSettingsScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabProvider>(builder: (context, snap, ch) {
      return Scaffold(
        body: pages[snap.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: snap.currentIndex,
          onTap: snap.changeTabIndex,
          backgroundColor: Colors.white.withOpacity(0.8),
          fixedColor: Theme.of(context).colorScheme.secondary,
          unselectedItemColor: Color.fromRGBO(153, 153, 153, 1),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              tooltip: 'Home',
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              tooltip: 'Settings',
              label: 'Settings',
            ),
          ],
        ),
      );
    });
  }
}
