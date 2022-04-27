import 'package:active_ecommerce_flutter/vendor/utils/components/switch_tile_widget.dart';
import 'package:flutter/material.dart';

class ProductStockVisibilityState extends StatefulWidget {
  const ProductStockVisibilityState({Key key}) : super(key: key);

  @override
  _ProductStockVisibilityStateState createState() => _ProductStockVisibilityStateState();
}

class _ProductStockVisibilityStateState extends State<ProductStockVisibilityState> {
  var showStock = true;
  var showStockText = false;
  var hideStock = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchTileWidget(
          enabled: showStock && !showStockText && !hideStock,
          onChanged: (v) {
            if (showStock) {
              return;
            }
            setState(() {
              showStock = true;
              showStockText = false;
              hideStock = false;
            });
          },
          title: 'Show Stock Quantity',
        ),
        SwitchTileWidget(
          enabled: showStockText && !hideStock && !showStock,
          onChanged: (v) {
            if (showStockText) {
              return;
            }
            setState(() {
              showStock = false;
              showStockText = true;
              hideStock = false;
            });
          },
          title: 'Show Stock With Text Only',
        ),
        SwitchTileWidget(
          enabled: !showStock && !showStockText && hideStock,
          onChanged: (v) {
            if (hideStock) {
              return;
            }
            setState(() {
              showStock = false;
              showStockText = false;
              hideStock = true;
            });
          },
          title: 'Hide Stock',
        ),
      ],
    );
  }
}
