import 'package:active_ecommerce_flutter/vendor/products/view/widgets/digitalProductView/digital_product_general_view.dart';
import 'package:active_ecommerce_flutter/vendor/products/view/widgets/digitalProductView/digital_product_price_view.dart';
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

class AddNewDigitalProductScreen extends StatefulWidget {
  const AddNewDigitalProductScreen({
    Key key,
  }) : super(key: key);

  @override
  _AddNewDigitalProductScreenState createState() =>
      _AddNewDigitalProductScreenState();
}

class _AddNewDigitalProductScreenState extends State<AddNewDigitalProductScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  List<dynamic> tabBarViewPages = [
    {
      'title': 'General',
      'page': DigitalProductInformationWidget(),
    },
    {
      'title': 'Images',
      'page': ProductImageView(),
    },

    {
      'title': 'Meta Tags',
      'page': ProductMetaDataView(),
    },
    {
      'title': 'Price',
      'page': DigitalProductPriceView(),
    },
    {
      'title': 'Product Information',
      'page': ProductDescriptionView(),
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
          'Add New Digital Product',
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
