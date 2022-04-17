import 'package:flutter/material.dart';
import 'package:active_ecommerce_flutter/my_theme.dart';

class InputDecorations {
  static InputDecoration buildInputDecoration_1(
      {hintText = "", bool filled = false, Color fillColor}) {
    return InputDecoration(
        filled: filled,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 12.0, color: MyTheme.textfield_grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.textfield_grey, width: 0.5),
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.textfield_grey, width: 1.0),
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0));
  }

  static InputDecoration buildInputDecorationPhone(
      {hintText = "", bool filled = false, Color fillColor}) {
    return InputDecoration(
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
        hintStyle: TextStyle(fontSize: 12.0, color: MyTheme.textfield_grey),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.textfield_grey, width: 0.5),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.textfield_grey, width: 1.0),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomRight: Radius.circular(5.0))),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0));
  }
}
