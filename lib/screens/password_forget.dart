import 'package:active_ecommerce_flutter/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:active_ecommerce_flutter/custom/input_decorations.dart';
import 'package:active_ecommerce_flutter/custom/intl_phone_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:active_ecommerce_flutter/addon_config.dart';
import 'package:active_ecommerce_flutter/screens/password_otp.dart';
import 'package:active_ecommerce_flutter/custom/toast_component.dart';
import 'package:toast/toast.dart';
import 'package:active_ecommerce_flutter/repositories/auth_repository.dart';
import 'package:active_ecommerce_flutter/helpers/shared_value_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordForget extends StatefulWidget {
  @override
  _PasswordForgetState createState() => _PasswordForgetState();
}

class _PasswordForgetState extends State<PasswordForget> {
  String _sendCodeBy = "email"; //phone or email
  String initialCountry = 'US';
  PhoneNumber phoneCode = PhoneNumber(isoCode: 'US');
  String _phone = "";

  //controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    //on Splash Screen hide statusbar
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  void dispose() {
    //before going to other screen show statusbar
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  onPressSendCode() async {
    var email = _emailController.text.toString();

    if (_sendCodeBy == 'email' && email == "") {
      ToastComponent.showDialog(
          AppLocalizations.of(context).password_forget_screen_email_warning,
          context,
          gravity: Toast.CENTER,
          duration: Toast.LENGTH_LONG);
      return;
    } else if (_sendCodeBy == 'phone' && _phone == "") {
      ToastComponent.showDialog(
          AppLocalizations.of(context).password_forget_screen_phone_warning,
          context,
          gravity: Toast.CENTER,
          duration: Toast.LENGTH_LONG);
      return;
    }

    var passwordForgetResponse = await AuthRepository()
        .getPasswordForgetResponse(
            _sendCodeBy == 'email' ? email : _phone, _sendCodeBy);

    if (passwordForgetResponse.result == false) {
      ToastComponent.showDialog(passwordForgetResponse.message, context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
    } else {
      ToastComponent.showDialog(passwordForgetResponse.message, context,
          gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PasswordOtp(
          verify_by: _sendCodeBy,
        );
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    final _screen_height = MediaQuery.of(context).size.height;
    final _screen_width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: app_language_rtl.$ ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: MyTheme.kMainBackgroundColor,
        body: Stack(
          children: [
            // Container(
            //   width: _screen_width * (3 / 4),
            //   child: Image.asset(
            //       "assets/splash_login_registration_background_image.png"),
            // ),
            Container(
              width: double.infinity,
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 15),
                    child: Container(
                      // width: 75,
                      // height: 75,
                      // child: Image.asset(
                      //     'assets/login_registration_form_logo.png'),
                      child: SvgPicture.asset(
                        "assets/svg/logoDarkMode.svg",
                        height: ScreenUtil().setHeight(70),
                        width: ScreenUtil().setWidth(70),
                      ),
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setSp(70)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      AppLocalizations.of(context).login_screen_forgot_password,
                      style: TextStyle(
                          color: MyTheme.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    width: _screen_width * 0.94,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            _sendCodeBy == "email"
                                ? AppLocalizations.of(context)
                                    .password_forget_screen_email
                                : AppLocalizations.of(context)
                                    .password_forget_screen_phone,
                            style: TextStyle(
                                color: MyTheme.white,
                                fontSize: ScreenUtil().setSp(16),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        if (_sendCodeBy == "email")
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 36,
                                  child: TextField(
                                    controller: _emailController,
                                    autofocus: false,
                                    decoration:
                                        InputDecorations.buildInputDecoration_1(
                                      hintText: "johndoe@example.com",
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                AddonConfig.otp_addon_installed
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _sendCodeBy = "phone";
                                          });
                                        },
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .password_forget_screen_send_code_via_phone,
                                          style: TextStyle(
                                              color: MyTheme.accent_color,
                                              fontStyle: FontStyle.italic,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 36,
                                  child: CustomInternationalPhoneNumberInput(
                                    onInputChanged: (PhoneNumber number) {
                                      print(number.phoneNumber);
                                      setState(() {
                                        _phone = number.phoneNumber;
                                      });
                                    },
                                    onInputValidated: (bool value) {
                                      print(value);
                                    },
                                    selectorConfig: SelectorConfig(
                                      selectorType:
                                          PhoneInputSelectorType.DIALOG,
                                    ),
                                    ignoreBlank: false,
                                    autoValidateMode: AutovalidateMode.disabled,
                                    selectorTextStyle:
                                        TextStyle(color: MyTheme.font_grey),
                                    initialValue: phoneCode,
                                    textFieldController: _phoneNumberController,
                                    formatInput: true,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            signed: true, decimal: true),
                                    inputDecoration: InputDecorations
                                        .buildInputDecorationPhone(
                                            hintText: "01710 333 558"),
                                    onSaved: (PhoneNumber number) {
                                      print('On Saved: $number');
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _sendCodeBy = "email";
                                    });
                                  },
                                  child: Text(
                                    AppLocalizations.of(context)
                                        .password_forget_screen_send_code_via_email,
                                    style: TextStyle(
                                        color: MyTheme.accent_color,
                                        fontStyle: FontStyle.italic,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          ),
                        SizedBox(
                          height: ScreenUtil().setSp(100),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: MyTheme.textfield_grey, width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12.0))),
                            child: FlatButton(
                              minWidth: MediaQuery.of(context).size.width,
                              //height: 50,
                              color: MyTheme.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0))),
                              child: Text(
                                AppLocalizations.of(context)
                                    .otp_screen_btn_send_code,
                                style: TextStyle(
                                    color: MyTheme.accent_color,
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                onPressSendCode();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
