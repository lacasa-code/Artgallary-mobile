import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import '../../utils/helper/media_query.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_cash_on_delivery_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_description_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_estimate_shipping_days_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_image_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_information_widget.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_low_stock_warning_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_meta_data_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_pdf_specification_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_price_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_shipping_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_variation_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_vat_and_tax_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/product_video_link_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/stock_visibility_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({
    Key key,
  }) : super(key: key);

  @override
  _AddNewProductScreenState createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<dynamic> tabBarViewPages = [
    {
      'title': 'Product Information',
      'page': ProductInformationWidget(),
    },
    {
      'title': 'Product Images',
      'page': ProductImageView(),
    },
    {
      'title': 'Product Videos',
      'page': ProductVideoLinkView(),
    },
    {
      'title': 'Product Variation',
      'page': ProductVariationView(),
    },
    {
      'title': 'Product price + stock',
      'page': ProductPriceView(),
    },
    {
      'title': 'Product Description',
      'page': ProductDescriptionView(),
    },
    {
      'title': 'PDF Specification',
      'page': ProductPDFSpecificationView(),
    },
    {
      'title': 'SEO Meta Tags',
      'page': ProductMetaDataView(),
    },

    {
      'title': 'Shipping Configuration',
      'page': ProductShippingView(),
    },
    {
      'title': 'Low Stock Quantity Warning',
      'page': ProductLowStockWarningView(),
    },
    {
      'title': 'Stock Visibility State',
      'page': ProductStockVisibilityState(),
    },
    {
      'title': 'Cash on Delivery',
      'page': ProductCashOnDeliveryView(),
    },
    {
      'title': 'Estimate Shipping Time',
      'page': ProductEstimateShippingDaysView(),
    },
    {
      'title': 'Vat & TAX',
      'page': ProductVatAndTaxView(),
    },
    // SizedBox(
    //   height: 10,
    // ),
    // ProductImageView(),
    // ProductVideoLinkView(),
    // ProductVariationView(),
    // ProductPriceView(),
    // ProductDescriptionView(),
    // ProductPDFSpecificationView(),
    // ProductMetaDataView(),

    // SizedBox(
    //   height: 10,
    // ),
    // ProductShippingView(),

    // ProductLowStockWarningView(),
    // ProductStockVisibilityState(),

    // ProductCashOnDeliveryView(),

    // ProductEstimateShippingDaysView(),
    // ProductVatAndTaxView(),
  ];

  @override
  void initState() {
    _controller = TabController(length: tabBarViewPages.length, vsync: this);
    super.initState();
  }

  bool get canContinue => _controller.index < _controller.length;
  bool get canCancel => _controller.index > 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add New Product',
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      backgroundColor: MyTheme.kMainBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _controller,
              children: List.generate(tabBarViewPages.length, (index) {
                var page = tabBarViewPages[index]['page'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        tabBarViewPages[index]['title'],
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Expanded(child: page),
                  ],
                );
              }),
            ),
          ),

          Expanded(
            flex: 1,
            child: SizedBox(
              height: ScreenUtil().setHeight(50),
              width: context.width,
              child: CoolStepper(
                config: CoolStepperConfig(),
                onCompleted: () {
                  OneContext.instance.navigator.pop();
                },
                onPageChanged: (i) {
                  setState(() {
                    _controller.index = i;
                  });
                },

                // steps: List.generate(tabBarViewPages.length, (index) {
                //   var title = tabBarViewPages[index]['title'];
                //   return CoolStep(
                //     validation: () {},
                //     title: title ?? '',
                //     subtitle: '',
                //     content: Container(),
                //   );
                // }),

                steps: List.generate(
                    tabBarViewPages.length,
                    (index) => CoolStep(
                        isHeaderEnabled: false,
                        title: '',
                        subtitle: '',
                        content: Container(),
                        validation: () {})),
              ),
            ),
          )

          // Expanded(
          //   child: TabBarView(
          //     physics: NeverScrollableScrollPhysics(),
          //     controller: _controller,
          //     children: [
          //       Icon(Icons.add),
          //       Icon(Icons.remove),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  Step _buildStep({
    @required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('Subtitle'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 0,
        maxHeight: 0,
        child: Container(color: CupertinoColors.systemGrey),
      ),
    );
  }
}
