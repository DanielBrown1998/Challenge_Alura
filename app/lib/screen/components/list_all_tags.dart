import 'package:app/models/tags_objects.dart';
import 'package:app/screen/components/tags_video.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListAllTags extends StatelessWidget {
  const ListAllTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<TagsObjects>(
        builder: (BuildContext context, TagsObjects list, Widget? child) {
          return ListView.builder(
            itemCount: list.tags.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: 24,
                  bottom: 24,
                ),
                child: TagsVideo(
                  tag: list.tags[index].tagName,
                  colorText: list.tags[index].textColor,
                  backgroundColor: list.tags[index].backColor,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
