import 'package:active_ecommerce_flutter/vendor/shopVerfication/view/shop_verfication_screen.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';

class VerficationView extends StatelessWidget {
  const VerficationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/non_verified.png',
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xffC08470),
                  ),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
              onPressed: () {
                OneContext.instance.navigator.push(
                  MaterialPageRoute(
                    builder: (_) => ShopVerficationScreen(),
                  ),
                );
              },
              child: Text(
                'Verify Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
