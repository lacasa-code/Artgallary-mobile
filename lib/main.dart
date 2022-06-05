import 'package:active_ecommerce_flutter/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_value/shared_value.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'dart:async';
import 'package:active_ecommerce_flutter/repositories/auth_repository.dart';

//  02 353 20740
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  try {
    fetch_user() async {
      // try {} catch (error) {
      //   Fluttertoast.showToast(
      //     msg: '$error',
      //     backgroundColor: Colors.red,
      //   );
      // }
      var userByTokenResponse = await AuthRepository().getUserByTokenResponse();

      if (userByTokenResponse.result == true) {
        is_logged_in.$ = true;
        is_logged_in.save();
        user_id.$ = userByTokenResponse.id;
        user_id.save();
        user_name.$ = userByTokenResponse.name;
        user_name.save();
        user_name.$ = userByTokenResponse.email;
        user_name.save();
        user_phone.$ = userByTokenResponse.phone;
        user_phone.save();
        avatar_original.$ = userByTokenResponse.avatar_original;
        avatar_original.save();
      }
    }

    app_language.load();
    app_mobile_language.load();
    app_language_rtl.load();

    access_token.load().whenComplete(() {
      fetch_user();
    });
  } catch (error) {
    Fluttertoast.showToast(
      msg: '$error',
      backgroundColor: Colors.red,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  runApp(
    SharedValue.wrapApp(
      MyApp(),
    ),
  );
}
