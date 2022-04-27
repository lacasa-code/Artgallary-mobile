import 'package:flutter/material.dart';


class PageProfileHeaderItem extends StatelessWidget {
  const PageProfileHeaderItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffC08470),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: const AssetImage('assets/profile2.png'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Shop Name',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'test@test.com',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}