import 'package:flutter/material.dart';
import '../helper/media_query.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    Key key,
    this.labelText,
    @required this.items,
    @required this.onChanged,
    @required this.validator,
    this.removePadding = false,
    this.initialValue,
    this.hintText,
  }) : super(key: key);
  final String labelText;
  final String hintText;
  final List<String> items;
  final int initialValue;
  final bool removePadding;
  final String Function(int) validator;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: removePadding
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: DropdownButtonFormField<int>(
        isExpanded: true,
        icon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.black,
        ),
        validator: validator,
        value: initialValue,
        hint: hintText == null ? null : Text(hintText),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: ScreenUtil().setHeight(13),
                horizontal: context.width * 0.02),
            labelText: labelText,
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
            errorStyle: const TextStyle(color: Colors.red)),
        onChanged: onChanged,
        items: List.generate(
          items.length,
          (index) => DropdownMenuItem(
            value: index,
            child: Text(
              items[index],
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
