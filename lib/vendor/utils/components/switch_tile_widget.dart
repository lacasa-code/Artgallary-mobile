import 'package:flutter/material.dart';


class SwitchTileWidget extends StatelessWidget {
  const SwitchTileWidget({
    Key key,
    @required this.enabled,
    @required this.onChanged,
    @required this.title,
  }) : super(key: key);

  final bool enabled;
  final void Function(bool) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Switch(
            value: enabled,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}