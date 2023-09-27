import 'package:akademiklink/shared/theme.dart';
import 'package:flutter/material.dart';

class StudentMenu extends StatelessWidget {
  final String title;
  final IconData iconMenu;
  final VoidCallback? onTap;

  const StudentMenu({
    super.key,
    required this.title,
    required this.iconMenu,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 130,
            width: 130,
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.grey),
              color: whiteColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Icon(
                    iconMenu,
                    size: 26,
                    color: blackColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
