import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:universal_lab/class/app_constant.dart';

class StackHeartIcon extends StatefulWidget {
  final double? t;
  final double? b;
  final double? r;
  final double? l;
  final Color? heartColor;

  final VoidCallback favoriteToggle;
  const StackHeartIcon(
      {Key? key,
      this.heartColor = kDark,
      this.t = 10,
      this.b,
      this.l,
      this.r = 10,
      required this.favoriteToggle})
      : super(key: key);

  @override
  State<StackHeartIcon> createState() => _StackHeartIconState();
}

class _StackHeartIconState extends State<StackHeartIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.t,
      left: widget.l,
      right: widget.r,
      bottom: widget.b,
      child: InkWell(
        onTap: widget.favoriteToggle,
        child: FaIcon(FontAwesomeIcons.heart, color: widget.heartColor),
      ),
    );
  }
}

class StackCustomIcon extends StatefulWidget {
  final double? t;
  final double? b;
  final double? r;
  final double? l;
  final double? size;
  final double? padding;
  final Color? iconColor;
  final Color? cardColor;
  final double? elevation;
  final VoidCallback onTap;
  final IconData icon;

  const StackCustomIcon(
      {Key? key,
      this.iconColor = kDark,
      this.t,
      this.b,
      this.l,
      this.r,
        this.size = 12,
      this.cardColor = Colors.transparent,
      this.padding = 3,
      this.elevation = 0,
      required this.onTap,
      required this.icon})
      : super(key: key);

  @override
  State<StackCustomIcon> createState() => _StackCustomIconState();
}

class _StackCustomIconState extends State<StackCustomIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.t,
      left: widget.l,
      right: widget.r,
      bottom: widget.b,
      child: Card(
        elevation: widget.elevation,
        color: widget.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: EdgeInsets.all(widget.padding!),
          child: InkWell(
            onTap: widget.onTap,
            child: FaIcon(widget.icon, color: widget.iconColor, size:widget.size,),
          ),
        ),
      ),
    );
  }
}
