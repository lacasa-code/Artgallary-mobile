import 'dart:io';

import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/picked_image_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({
    Key key,
  }) : super(key: key);

  @override
  _TicketDetailsScreenState createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  File pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.kMainBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Ticket Details',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            RegisterField(
              verticalPadding: 10,
              maxLine: null,
              labelText: 'Reply Message',
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
              title: 'Choose File',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/profile2.png',
                    ),
                  ),
                  title: Text(
                    'Name',
                  ),
                  subtitle: Text(DateTime.now().toString().substring(0, 10)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    'Message test text ......',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Color(0xffDAE1E4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.download,
                            color: Color(0xff98A0A5),
                          ),
                          Text(
                            'imagename',
                            style: TextStyle(
                              color: Color(0xff98A0A5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
