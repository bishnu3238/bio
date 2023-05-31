import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSliverAppBar extends StatefulWidget {
  final String? title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final double? expandedHeight;
  final Widget? flexibleSpaceBar;

  const CustomSliverAppBar({
    super.key,
    this.bottom,
    this.title,
    this.expandedHeight,
    this.actions,
    this.leading,
    this.flexibleSpaceBar,
  });

  @override
  @override
  State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  final bool _pinned = true;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: _pinned,
      floating: true,
      delegate: _SliverAppBarDelegate(
        leading: widget.leading,
        title: widget.title ?? "",
        actions: widget.actions,
        bottom: widget.bottom,
        expandedHeight: widget.expandedHeight,
        flexibleSpaceBar: widget.flexibleSpaceBar,
        context: context,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final String title;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final BuildContext context;
  final List<Widget>? actions;
  final double? expandedHeight;
  final Widget? flexibleSpaceBar;

  _SliverAppBarDelegate(
      {required this.leading,
      required this.title,
      required this.actions,
      this.bottom,
      this.flexibleSpaceBar,
      this.expandedHeight,
      required this.context});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: leading,
      title: Image.asset('assets/logo/app_logo.png'),
      // Text(title),
      actions: actions,
      toolbarHeight: expandedHeight,
      bottom: bottom,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
    );
  }

  @override
  double get maxExtent => bottom == null
      ? kToolbarHeight + MediaQuery.of(context).padding.top
      : (kToolbarHeight * 2) + MediaQuery.of(context).padding.top;

  @override
  double get minExtent =>
      kToolbarHeight + (MediaQuery.of(context).padding.top + 8);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
