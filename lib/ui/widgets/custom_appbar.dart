import 'package:akademiklink/shared/theme.dart';
import 'package:flutter/material.dart';

AppBar buildCustomAppBar(String title) {
  return AppBar(
    backgroundColor: darkBackgroundColor,
    title: Text(
      title,
      style: yellowTextStyle.copyWith(
        fontWeight: semiBold,
        fontSize: 18,
      ),
    ),
    centerTitle: true,
    elevation: 0,
  );
}
