import "package:app/models/tags.dart";
import "package:app/screen/theme/theme.dart";
import "package:flutter/material.dart";

class TagsObjects extends ChangeNotifier {
  List<Tags> tags = [
    Tags(
      tagName: "FrontEnd",
      textColor: ChalengeColors.primaryTextColor,
      backColor: Colors.purple,
    ),
    Tags(
      tagName: "Programacao",
      textColor: ChalengeColors.primaryTextColor,
      backColor: Colors.red,
    ),
    Tags(
      tagName: "Mobile",
      textColor: ChalengeColors.primaryTextColor,
      backColor: Colors.amber,
    ),
    Tags(
      tagName: "DataScience",
      textColor: ChalengeColors.primaryTextColor,
      backColor: Colors.deepOrange,
    ),
    Tags(
      tagName: "DevOps",
      textColor: ChalengeColors.primaryTextColor,
      backColor: Colors.teal,
    ),
    Tags(
      tagName: "UX e Design",
      textColor: ChalengeColors.primaryTextColor,
      backColor: Colors.pink,
    ),
  ];
}
