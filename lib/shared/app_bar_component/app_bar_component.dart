import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({
    required this.title,
    this.leading,
    Key? key,
  }) : super(key: key);

  final String title;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
