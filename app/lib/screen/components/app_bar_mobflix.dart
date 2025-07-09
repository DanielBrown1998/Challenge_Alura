import 'package:app/screen/theme/theme.dart';
import 'package:flutter/material.dart';

class AppBarMobflix {
  static AppBar appBar(title) => AppBar(
    backgroundColor: ChalengeColors.backgroundColorApp,
    elevation: 10,
    titleTextStyle: TextStyle(
      color: ChalengeColors.titleTextColor,
      fontSize: 26,
      fontWeight: FontWeight.w600,
    ),

    title: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(title),
    ),
    centerTitle: true,
  );
}
