import 'package:flutter/material.dart';


class SettingsMenuItem extends StatelessWidget {
  const SettingsMenuItem({
    Key key,
    @required this.title,
    @required this.icons,
    @required this.onTap,
  }) : super(key: key);
  final String title;
  final IconData icons;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icons ?? Icons.list_alt_outlined,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        title ?? '',
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
