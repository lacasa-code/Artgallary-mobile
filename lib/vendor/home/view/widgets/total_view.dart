import 'package:flutter/material.dart';
import './customized_card_widget.dart';


class TotalView extends StatelessWidget {
  const TotalView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        CustomizedCardWidget(
          color: Color(0xff8CCCF2),
          title: 'Products',
          quantity: '12',
        ),
        CustomizedCardWidget(
          color: Color(0xffE684B4),
          quantity: '23',
          title: 'Total Sale',
        ),
        CustomizedCardWidget(
          color: Color(0xff9C88D2),
          title: 'Total Earning',
          quantity: 'SR0.0',
        ),
        CustomizedCardWidget(
          color: Color(0xff5BA7E5),
          title: 'Successful orders',
          quantity: '0',
        ),
      ],
    );
  }
}
