import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/media_query.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key key,
    this.onValidator,
    this.controller,
    this.hintText,
    this.labelText,
    this.obsecureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.enabled = true,
    this.removePadding = false,
    this.maxLine = 1,
    this.formatter,
    this.focusNode,
    this.onChanged,
    this.helperText,
    this.initialValue,
    this.verticalPadding = 0.0,
    // this.onValidator
  }) : super(key: key);
  final String Function(String) onValidator;
  final TextEditingController controller;
  final String hintText, labelText;
  final bool obsecureText;
  final bool enabled, removePadding;
  final Widget suffixIcon;
  final TextInputType keyboardType;
  final int maxLine;
  final List<TextInputFormatter> formatter;
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final String helperText;
  final String initialValue;
  final double verticalPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: removePadding
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              horizontal: 15,
              vertical: verticalPadding,
            ),
      child: TextFormField(
        initialValue: initialValue,
        maxLines: maxLine,
        enabled: enabled,
        inputFormatters: formatter,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: onValidator,
        obscureText: obsecureText,
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
              vertical: context.height * (0.022),
              horizontal: context.width * 0.02),
          labelText: labelText == null ? null : labelText,
          hintText: hintText == null ? null : hintText,
          helperText: helperText,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffa3a3a3)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffa3a3a3)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffa3a3a3)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffa3a3a3)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
