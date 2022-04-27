import 'package:active_ecommerce_flutter/vendor/utils/components/drop_down_field.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/register_field.dart';
import 'package:flutter/material.dart';


class ProductVideoLinkView extends StatelessWidget {
  const ProductVideoLinkView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownField(
          labelText: 'Video Provider',
          items: [
            'youtube',
            'dailymotion',
            'vimeo',
          ],
          onChanged: (v) {},
          validator: (v) {
            return null;
          },
        ),
        RegisterField(
          labelText: 'Video Link',
          hintText: 'Video Link',suffixIcon: Icon(
              Icons.link,
              color: Theme.of(context).colorScheme.secondary,
            ),
          keyboardType: TextInputType.url,
        ),
      ],
    );
  }
}
