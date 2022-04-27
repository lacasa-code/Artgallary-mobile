import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ProductPDFSpecificationView extends StatelessWidget {
  const ProductPDFSpecificationView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FilePickerResult result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            'pdf',
          ],
        );
      },
      child: RegisterField(
        labelText: 'Pdf Specification',
        // maxLine: null,
        enabled: false,
        suffixIcon: Icon(
          Icons.camera_alt_outlined,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
