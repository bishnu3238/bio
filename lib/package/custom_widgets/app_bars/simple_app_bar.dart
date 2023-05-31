import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
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
  final Widget? flexibleSpace;
  const SimpleAppBar(
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
        this.flexibleSpace,
      this.tabBarHeight});

  @override
  Size get preferredSize => Size.fromHeight(tabBarHeight ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: tPosition,
      automaticallyImplyLeading: icon == null ? false : true,
      title:
      Text(
        title ?? '',
        style: GoogleFonts.poppins(color: color == null ? Colors.black: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
      ),
      elevation: elevation ?? 0,
      actions: [...?buttons],
      leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: icon == null ?Colors.transparent:  Theme.of(context).colorScheme.onBackground),
          child: IconButton(
              padding: EdgeInsets.zero, onPressed: todo, icon: Icon(icon))),
      backgroundColor: color ?? Colors.white,
      bottom: tabBar,
      flexibleSpace: flexibleSpace,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: color ?? Colors.white,
        statusBarIconBrightness:
            color == null ? Brightness.dark : Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}
