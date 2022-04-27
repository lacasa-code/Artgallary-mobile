import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/purchase/view/purchase_history_screen.dart';
import 'package:flutter/material.dart';

class CouponItem extends StatelessWidget {
  const CouponItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.discount_outlined,
                color: MyTheme.kMainBackgroundColor,
                size: 25,
              ),
            ),
            title: Text(
              'LaVieEnRose',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            subtitle: Text(
              'type: Cart Base \nfrom: 09-05-2022 to: 09-05-2022',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                // fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05,
          top: MediaQuery.of(context).size.height * 0.01,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.scale(
                scale: 0.8,
                child: OptionItem(
                  icons: Icons.edit,
                  backgroundColor: Color.fromARGB(255, 226, 229, 237),
                  iconColor: Color(0xff8F97AA),
                  onTap: () {},
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Transform.scale(
                scale: 0.8,
                child: OptionItem(
                  icons: Icons.delete,
                  backgroundColor: Color(0xffFCE5E9),
                  iconColor: Colors.red,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
