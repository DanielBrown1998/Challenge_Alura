import 'package:app/models/videos.dart';
import 'package:app/models/videos_objects.dart';
import 'package:app/screen/components/add_video.dart';
import 'package:app/screen/components/app_bar_mobflix.dart';
import 'package:app/screen/components/list_all_tags.dart';
import 'package:app/screen/components/video_selected_widget.dart';
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
  Videos? video;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMobflix.appBar(widget.title),
      body: Column(
        children: [
          ConstrainedBox(
            constraints:
                video != null
                    ? BoxConstraints(minHeight: 250)
                    : BoxConstraints(minHeight: 100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height:
                  video != null
                      ? MediaQuery.of(context).size.height * .25
                      : MediaQuery.of(context).size.height * .05,
              child: Column(
                children: [
                  (video != null)
                      ? VideoSelectedWidget(video: video!)
                      : SizedBox(height: 0),
                  ListAllTags(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Consumer<VideosObjects>(
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
        onPressed: () async {
          Navigator.pushNamed(context, "addVideoScreen/");
        }, //TODO implementar tela para adicionar video
        tooltip: 'Increment',
        elevation: 10,
        shape: CircleBorder(),
        backgroundColor: ChalengeColors.titleTextColor,
        child: Icon(Icons.add, color: ChalengeColors.primaryTextColor),
      ),
    );
  }
}
