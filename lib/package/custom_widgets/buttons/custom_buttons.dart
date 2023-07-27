import 'package:flutter/material.dart';
import 'package:universal_lab/class/app_constant.dart';
import 'package:universal_lab/package/text_style.dart';


class Buttons extends StatelessWidget {
  final String text;
  final Color? color;
  final MaterialStateProperty<Size?>? size;

  final VoidCallback? onTap;
  const Buttons({Key? key, required this.text, this.color, this.onTap, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(fixedSize:  size,
              backgroundColor:
              MaterialStatePropertyAll(onTap == null ? null : color),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.fromLTRB(10, 12, 10, 12))),
          child: Text(
            text,
            style: stlBtn(color == null
                ? Colors.white
                : color == kLight
                ? kDBlue
                : Colors.white),
          )),
    );
  }
}

class ButtonsIcon extends StatelessWidget {
  final String text;
  final Color? color;
  final IconData? icon;

  final VoidCallback? onTap;
  const ButtonsIcon(
      {Key? key, required this.text, this.color, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon:
        Icon(icon, color: color == null ? kLight : kDBlue, size: 18),
        onPressed: onTap,
        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
        label: Text(
          text,
          style: stlBtn(kDBlue),
        ));
  }
}
