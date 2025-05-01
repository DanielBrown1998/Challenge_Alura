import 'package:app/models/tags.dart';
import 'package:flutter/material.dart';
import 'package:app/screen/components/tags_video.dart';

class CardVideo extends StatefulWidget {
  final String url;
  final Tags tags;
  const CardVideo({super.key, required this.url, required this.tags});

  @override
  State<CardVideo> createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: TagsVideo(
              tag: widget.tags.tagName,
              colorText: widget.tags.textColor,
              backgroundColor: widget.tags.backColor,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                print(widget.url);
              },
              child: Text(widget.url, style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
