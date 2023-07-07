import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:universal_lab/class/widget_lavel_provider/notifier.dart';
import 'package:universal_lab/package/text_style.dart';

class LoadingButton extends StatefulWidget {
  final String text;
  final Color? color;
  final Function()? onPressed;

  const LoadingButton({
    Key? key,
    required this.text,
    this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Consumer<Notifier>(
        builder: (context, notifier, _) {
          return ElevatedButton(
            onPressed: widget.onPressed == null
                ? null
                : notifier.loading
                    ? null
                    : () => widget.onPressed!(),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 13),
              backgroundColor: widget.color ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: notifier.loading
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Waiting",
                        style: GoogleFonts.rubikBurned(
                            color: Colors.white,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 10),
                      SpinKitDualRing(
                        color: widget.color != null
                            ? Colors.white
                            : Colors.redAccent.shade200,
                        size: 20,
                      ),
                    ],
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      color: widget.color == null
                          ? const Color(0xFF2E2F60)
                          : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
