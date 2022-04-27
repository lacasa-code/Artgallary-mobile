import 'package:active_ecommerce_flutter/vendor/utils/components/multiselect_dropdown_widget.dart';
import 'package:active_ecommerce_flutter/vendor/utils/components/searchable_dropdown_widget.dart';
import 'package:flutter/material.dart';

class ProductVariationView extends StatefulWidget {
  const ProductVariationView({
    Key key,
  }) : super(key: key);

  @override
  _ProductVariationViewState createState() => _ProductVariationViewState();
}

class _ProductVariationViewState extends State<ProductVariationView> {
  var enabled = false;
  List<int> selectedItemsIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: SearchableDropDownWidget(
                enabled: enabled,
                thinBorder: true,
                values: [
                  'red',
                  'blue',
                  'black',
                ],
                labelText: 'Color',
                onChanged: (v) {},
              ),
            ),
            Expanded(
                child: Switch(
              value: enabled,
              onChanged: (v) {
                setState(() {
                  enabled = v;
                });
              },
            ))
          ],
        ),
        MultiselectDropdownWidget(
          values: [
            'Size',
            'Fabric',
          ],
          labelText: 'Attributes',
          thinBorder: true,
          selectedItems: selectedItemsIndex?.map((e) => e.toString())?.toList(),
          onChanged: (selectedValues) {
            if (selectedValues == null) {
              return;
            }
            setState(() {
              selectedItemsIndex =
                  List.generate(selectedValues.length, (index) => index)
                      .toList();
            });
          },
        ),
        if ((selectedItemsIndex ?? []).indexWhere((element) => element == 0) >=
            0) ...[
          SearchableDropDownWidget(
            enabled: enabled,
            thinBorder: true,
            values: [],
            labelText: 'Size',
            onChanged: (v) {},
          ),
        ],
        if ((selectedItemsIndex ?? []).indexWhere((element) => element == 1) >=
            0) ...[
          SearchableDropDownWidget(
            thinBorder: true,
            values: [],
            labelText: 'Fabric',
            onChanged: (v) {},
          ),
        ],
      ],
    );
  }
}
