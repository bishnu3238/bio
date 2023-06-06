import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/model/cart/cart.dart';
import 'package:universal_lab/class/model/universal_lab_provider.dart';

import '../../../screens/cart/cart_screen.dart';
import '../../navigate.dart';
import '../cart_icon.dart';
import '../search_icon.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? color;
  final String? title;
  final IconData? icon;
  final bool? tPosition;
  final double? elevation;
  final VoidCallback? todo;
  final TextStyle? style;
  final double? tabBarHeight;
  final List<Widget>? buttons;
  final PreferredSizeWidget? tabBar;
  const AppAppBar(
      {super.key,
      this.title,
      this.color,
      this.tPosition = true,
      this.elevation,
      this.icon,
      this.style,
      this.buttons,
      this.todo,
      this.tabBar,
      this.tabBarHeight});

  @override
  Size get preferredSize => Size.fromHeight(tabBarHeight ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: tPosition,
      title: Text(
        title ?? '',
        style: style ??
            GoogleFonts.lindenHill(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w900),
      ),
      elevation: elevation ?? 0,
      actions: [
        ...?buttons,
        const SearchIcon(),
        const CartIcon(),
      ],
      leading: icon == null
          ? null
          : Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.surface),
              child: IconButton(
                  padding: EdgeInsets.zero, onPressed: todo, icon: Icon(icon))),
      toolbarTextStyle: const TextStyle(color: Colors.black),
      backgroundColor: color ?? Colors.white,
      bottom: tabBar,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: color ?? Colors.white,
          statusBarIconBrightness:
              color == null ? Brightness.dark : Brightness.light,
          statusBarBrightness: Brightness.dark),
    );
  }
}
