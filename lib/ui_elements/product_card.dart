import 'package:active_ecommerce_flutter/custom/toast_component.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:active_ecommerce_flutter/repositories/cart_repository.dart';
import 'package:active_ecommerce_flutter/repositories/wishlist_repository.dart';
import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/screens/product_details.dart';
import 'package:active_ecommerce_flutter/app_config.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toast/toast.dart';

class ProductCard extends StatefulWidget {
  int id;
  String image;
  String name;
  String main_price;
  String stroked_price;
  bool has_discount;
  bool isFav;

  ProductCard({
    Key key,
    this.id,
    this.image,
    this.name,
    this.main_price,
    this.stroked_price,
    this.has_discount,
    this.isFav = false,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  var _isInWishList = false;
  addToWishList() async {
    var wishListCheckResponse =
        await WishListRepository().add(product_id: widget.id);

    //print("p&u:" + widget.id.toString() + " | " + _user_id.toString());
    _isInWishList = wishListCheckResponse.is_in_wishlist;
    setState(() {});
  }

  removeFromWishList() async {
    var wishListCheckResponse =
        await WishListRepository().remove(product_id: widget.id);

    //print("p&u:" + widget.id.toString() + " | " + _user_id.toString());
    _isInWishList = wishListCheckResponse.is_in_wishlist;
    setState(() {});
  }

  onWishTap() {
    if (is_logged_in.$ == false) {
      ToastComponent.showDialog(
          AppLocalizations.of(context).common_login_warning, context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
      return;
    }

    if (_isInWishList) {
      _isInWishList = false;
      setState(() {});
      removeFromWishList();
    } else {
      _isInWishList = true;
      setState(() {});
      addToWishList();
    }
  }

  @override
  void initState() {
    _isInWishList = widget.isFav;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print((MediaQuery.of(context).size.width - 48) / 2);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetails(
            id: widget.id,
          );
        }));
      },
      child: Stack(
        children: [
          Card(
            //clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              side: new BorderSide(color: MyTheme.light_grey, width: 1.0),
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      //height: 158,
                      height:
                          ((MediaQuery.of(context).size.width - 48) / 2) + 2,
                      child: ClipRRect(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16), bottom: Radius.zero),
                          child: FadeInImage.assetNetwork(
                            placeholder: 'assets/placeholder.png',
                            image: AppConfig.BASE_PATH + widget.image,
                            fit: BoxFit.cover,
                          ))),
                  Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                          child: Text(
                            widget.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                color: MyTheme.font_grey,
                                fontSize: 14,
                                height: 1.2,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
                          child: Text(
                            widget.main_price,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: MyTheme.accent_color,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        widget.has_discount
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                                child: Text(
                                  widget.stroked_price,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: MyTheme.medium_grey,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ]),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.width * 0.01,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                // vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        // padding: MaterialStateProperty.all(
                        //   EdgeInsets.zero,
                        // ),
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.golden,
                        ),
                      ),
                      onPressed: () async {
                        var cartAddResponse =
                            await CartRepository().getCartAddResponse(
                          widget.id,
                          '',
                          user_id.$,
                          1,
                        );
                        if (cartAddResponse != null) {
                          // if (cartAddResponse.result) {
                          Toast.show(
                            cartAddResponse.message,
                            context,
                            backgroundColor: cartAddResponse.result
                                ? Colors.white
                                : Colors.red,
                          );
                          // }
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context)
                            .product_details_screen_button_add_to_cart,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  _isInWishList
                      ? InkWell(
                          onTap: () {
                            onWishTap();
                          },
                          child: Icon(
                            FontAwesome.heart,
                            color: Color.fromRGBO(230, 46, 4, 1),
                            size: 20,
                          ),
                        )
                      : InkWell(
                          onTap: () {
                            onWishTap();
                          },
                          child: SvgPicture.asset(
                            'assets/svg/Heart.svg',
                            color: Color.fromRGBO(230, 46, 4, 1),
                            // size: 20,
                            height: 20,
                            width: 20,
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
