import 'package:flutter/material.dart';

var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text =
      "@ArtGallery " + this_year; //this shows in the splash screen
  static String app_name = "Oryx 44"; //this shows in the splash screen
  static String purchase_code =
      "9c5cebe7-94ec-4423-a5b5-33f4a36440ab"; //enter your purchase code for the app from codecanyon
  //static String purchase_code = ""; //enter your purchase code for the app from codecanyon

  //configure this
  static const bool HTTPS = false;

  //configure this
  static const DOMAIN_PATH = "artgallery.lacasacode.com"; //localhost
  //static const DOMAIN_PATH = "demo.activeitzone.com/ecommerce_flutter_demo"; //inside a folder
  //static const DOMAIN_PATH = "mydomain.com"; // directly inside the public folder

  //do not configure these below
  static const String API_ENDPATH = "api/v2";
  static const String PUBLIC_FOLDER = "public";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";

  //configure this if you are using amazon s3 like services
  //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
  //otherwise do not change anythink
  static const String BASE_PATH = "${RAW_BASE_URL}/${PUBLIC_FOLDER}/";
  //static const String BASE_PATH = "https://tosoviti.s3.ap-southeast-2.amazonaws.com/";
}
