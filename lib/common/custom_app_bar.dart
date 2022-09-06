///The custom Appbar widget created for Application.

import 'package:flutter/material.dart';
import '../utils/navigations.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;
  final bool centerTitle;
  final Color backgroundColor;
  final dynamic icon;
  final Color iconColor;
  final double iconSize;

  CustomAppBar({
    this.title,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor = Colors.black,
    this.iconSize = 24,
    this.icon = Icons.arrow_back,
    this.iconColor,
  });

  static void goBack(BuildContext context) {
    Navigation.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      // todo: need to add this
      // actions: [
      //   IconButton(
      //     onPressed: () => {},
      //     icon: Icon(
      //       Icons.refresh,
      //       color: iconColor ?? AppColors.white,
      //       size: iconSize,
      //     ),
      //   )
      //],
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
