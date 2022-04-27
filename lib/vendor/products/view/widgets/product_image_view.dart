import 'dart:io';
import 'package:active_ecommerce_flutter/vendor/utils/components/custom_image.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/image_picker_dialog.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductImageView extends StatefulWidget {
  const ProductImageView({
    Key key,
  }) : super(key: key);

  @override
  _ProductImageViewState createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  List<File> myImages = [];
  File pickedImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            var multiImages = await ImagePicker().pickMultiImage();
            if (multiImages == null) {
              return;
            }
            List<File> pickedImages = [];
            for (var i = 0; i < multiImages.length; i++) {
              var image = File(multiImages[i].path);
              pickedImages.add(image);
            }
            setState(() {
              myImages.addAll(pickedImages);
            });
          },
          child: RegisterField(
            enabled: false,
            labelText: 'Gallery Images',
            suffixIcon: Icon(
              Icons.camera_alt_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        if (myImages.isNotEmpty) ...[
          // SizedBox(
          //   height: ScreenUtil().setHeight(10),
          // ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                myImages.length,
                (index) => CustomImage(
                  pickedImage: myImages[index],
                  onRemoved: () {
                    setState(() {
                      myImages.removeAt(index);
                    });
                  },
                ),
              ),
            ),
          ),
        ],
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () async {
            ImagePickerDialog().show(
              context: context,
              onGet: (file) {
                if (file == null) {
                  return;
                }
                setState(() {
                  pickedImage = file;
                });
              },
            );
          },
          child: RegisterField(
            enabled: false,
            labelText: 'Thumbnail Image',
            suffixIcon: Icon(
              Icons.camera_alt_outlined,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        Visibility(
          visible: pickedImage != null,
          child: CustomImage(
            pickedImage: pickedImage,
            onRemoved: () {
              setState(() {
                pickedImage = null;
              });
            },
          ),
        ),
      ],
    );
  }
}
