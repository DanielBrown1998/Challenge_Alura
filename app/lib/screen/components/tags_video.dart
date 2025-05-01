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
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 50, maxHeight: 70, maxWidth: 150),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.elliptical(16, 16)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Center(
            child: Text(
              tag,
              style: TextStyle(
                color: colorText,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
