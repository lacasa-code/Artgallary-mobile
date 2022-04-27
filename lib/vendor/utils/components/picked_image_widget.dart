import 'dart:io';

import 'package:flutter/material.dart';
import './image_picker_dialog.dart';
import './custom_image.dart';
import './register_field.dart';

class PickedImageWidget extends StatelessWidget {
  const PickedImageWidget({
    Key key,
    @required this.onImagePicked,
    @required this.onRemoved,
    @required this.pickedImage,
    @required this.title,
  }) : super(key: key);

  final void Function(File) onImagePicked;
  final void Function() onRemoved;
  final File pickedImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            ImagePickerDialog().show(
              context: context,
              onGet: (file) {
                if (file == null) {
                  return;
                }
                onImagePicked(file);
                // setState(() {
                //   pickedImage = file;
                // });
              },
            );
          },
          child: RegisterField(
            verticalPadding: 5.0,
            enabled: false,
            labelText: title,
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
            onRemoved: onRemoved,
          ),
        ),
      ],
    );
  }
}
