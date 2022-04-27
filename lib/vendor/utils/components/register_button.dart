import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/media_query.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key key,
    this.title,
    this.noLocalText,
    @required this.onPressed,
    this.light = false,
    this.icon,
    this.removePadding = false,
    this.color,
  }) : super(key: key);
  final String title, noLocalText;
  final bool light, removePadding;
  final Function() onPressed;
  final Color color;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: removePadding
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 15),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all<Size>(
              Size(context.width, context.height * 0.07)),
          backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.secondary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
              side: !light
                  ? BorderSide.none
                  : BorderSide(
                      color: color ?? Colors.grey,
                    ),
            ),
          ),
        ),
        onPressed: onPressed,
        icon: icon ?? const SizedBox(),
        label: Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(14),
            color: light ? color ?? Colors.grey : Colors.white,
          ),
        ),
      ),
    );
  }
}
