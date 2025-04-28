import 'package:flutter/material.dart';
import 'package:app/screen/components/tags_video.dart';
import 'package:app/models/tags.dart';

class CardVideo extends StatefulWidget {
  final String nome;
  final List<Tags> tags;
  const CardVideo({super.key, required this.nome, required this.tags});

  @override
  State<CardVideo> createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.25,
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: Text(widget.nome, style: TextStyle(color: Colors.white)),
            ), // aqui insira o video
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.tags.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: TagsVideo(
                  tag: widget.tags[index].nome,
                  colorText: widget.tags[index].colorText,
                  backgroundColor: widget.tags[index].backgroundColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
