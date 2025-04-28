import 'package:flutter/material.dart';
import 'package:app/screen/components/card_video.dart';
import 'package:app/models/tags.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<Widget> videos = [
    CardVideo(
      nome: "video0",
      tags: [
        Tags(
          nome: "Full-Stack",
          colorText: Colors.white,
          backgroundColor: Colors.indigo,
        ),
        Tags(
          nome: "Mobile",
          colorText: Colors.white70,
          backgroundColor: Colors.orange,
        ),
        Tags(
          nome: "Flutter",
          colorText: Colors.white70,
          backgroundColor: Colors.lightBlue,
        ),
        Tags(
          nome: "Dart",
          colorText: Colors.white70,
          backgroundColor: Colors.blue,
        ),
      ],
    ),
    CardVideo(
      nome: "video1",
      tags: [
        Tags(
          nome: "Back-End",
          colorText: Colors.white,
          backgroundColor: Colors.purple,
        ),
        Tags(
          nome: "Python",
          colorText: Colors.white70,
          backgroundColor: Colors.red,
        ),
      ],
    ),
    CardVideo(
      nome: "video2",
      tags: [
        Tags(
          nome: "Front-End",
          colorText: Colors.white70,
          backgroundColor: Colors.blue,
        ),
        Tags(
          nome: "CSS",
          colorText: Colors.white70,
          backgroundColor: Colors.blueGrey,
        ),
        Tags(
          nome: "HTML",
          colorText: Colors.black,
          backgroundColor: Colors.yellowAccent,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Expanded(
        child: ListView.builder(
          itemCount: videos.length,
          itemBuilder: (BuildContext context, int index) {
            return videos[index];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, //TODO implementar tela para adicionar video
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
