import 'package:app/models/tags_objects.dart';
import 'package:app/models/videos.dart';
import 'package:app/models/videos_objects.dart';
import 'package:app/screen/components/tags_video.dart';
import 'package:flutter/material.dart';
import 'package:app/screen/components/card_video.dart';
import 'package:app/screen/theme/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Color buttonColor = ChalengeColors.primaryColorButton;
  double scaleMyButton = 1;
  Videos? video;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ChalengeColors.backgroundColorApp,
        elevation: 10,
        titleTextStyle: TextStyle(
          color: ChalengeColors.titleTextColor,
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),

        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(widget.title),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: video != null
                      ? BoxConstraints(minHeight: 250)
                      : BoxConstraints(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height:
                  video != null
                      ? MediaQuery.of(context).size.height * .25
                      : MediaQuery.of(context).size.height * .05,
              child: Column(
                children: [
                  video != null
                      ? Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * .18,
                            child: Image.network(
                              video!.thumbNail,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Center(
                                  child: Icon(
                                    Icons.error,
                                    color: ChalengeColors.primaryTextColor,
                                  ),
                                );
                              },
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    scaleMyButton = 1.1;
                                  });
                                  print("Button");
                                  //direcionar para abrir o youtube
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxWidth: 150,
                                    minWidth: 100,
                                    minHeight: 40,
                                    maxHeight: 50,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: buttonColor,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                  child: AnimatedScale(
                                    scale: scaleMyButton,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.easeInOutExpo,
                                    onEnd: () {
                                      setState(() {
                                        scaleMyButton = 1;
                                      });
                                    },
                                    child: Text(
                                      "Assistir Agora",
                                      style: TextStyle(
                                        color: ChalengeColors.primaryTextColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                      : SizedBox(height: 0),

                  Expanded(
                    child: Consumer(
                      builder: (
                        BuildContext context,
                        TagsObjects list,
                        Widget? child,
                      ) {
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
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer(
              builder: (
                BuildContext context,
                VideosObjects list,
                Widget? child,
              ) {
                return ListView.builder(
                  itemCount: list.videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                        right: 16,
                        top: 6,
                        bottom: 6,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            video = list.videos[index];
                          });
                        },
                        child: Ink(
                          child: CardVideo(
                            id: list.videos[index].id,
                            url: list.videos[index].url,
                            tags: list.videos[index].tag,
                            thumbNail: list.videos[index].thumbNail,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, //TODO implementar tela para adicionar video
        tooltip: 'Increment',
        elevation: 10,
        shape: CircleBorder(),
        backgroundColor: ChalengeColors.titleTextColor,
        child: Icon(Icons.add, color: ChalengeColors.primaryTextColor),
      ),
    );
  }
}
