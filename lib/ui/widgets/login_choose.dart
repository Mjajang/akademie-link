import 'package:akademiklink/shared/theme.dart';
import 'package:flutter/material.dart';

class LoginChoose extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onTap;

  const LoginChoose({
    super.key,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        width: 46,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: blackColor,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              imagePath.toString(),
              width: 26,
            ),
          ),
        ),
      ),
    );
  }
}
