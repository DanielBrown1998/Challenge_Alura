import 'package:flutter/material.dart';

class TagsVideo extends StatelessWidget {
  final String tag;
  final Color colorText;
  final Color backgroundColor;
  const TagsVideo({
    super.key,
    required this.tag,
    required this.colorText,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.elliptical(4, 2)),
      ),
      child: Center(child: Text(tag, style: TextStyle(color: colorText), textAlign: TextAlign.center)),
    );
  }
}
