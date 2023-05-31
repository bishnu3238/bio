import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingButton extends StatefulWidget {
  final String text;
  final Color? color;
  final Function() onPressed;

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
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          setState(() => _isLoading = true);

          await widget.onPressed();

          setState(() => _isLoading = false);
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13),
          backgroundColor: widget.color ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _isLoading
            ? SpinKitPouringHourGlassRefined(
                color: widget.color != null
                    ? Colors.white
                    : Colors.redAccent.shade200,
                size: 31,
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
      ),
    );
  }
}
