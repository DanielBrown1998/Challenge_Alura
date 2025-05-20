import 'package:app/models/tags.dart';
import 'package:app/models/tags_objects.dart';
import 'package:app/models/videos.dart';
import 'package:app/services/youtube_service.dart';
import 'package:flutter/material.dart';

class VideosObjects extends ChangeNotifier {
  List<Videos> videos;

  VideosObjects({required this.videos}) : super() {
    _loadVideos();
  }

  addVideo(Videos video) {
    videos.add(video);
  }

  bool removeVideo(Videos video) {
    return videos.remove(video);
  }

  Future<void> _loadVideos() async {
    final videoList = await YoutubeService.getVideos();
    videos =
        videoList.map((video) {
          print(video.keys);
          final Tags tag;
          List<Tags> tags = TagsObjects().tags;
          tag = tags.firstWhere((element) {
            return element.tagName.toLowerCase() ==
                video["tag"].toString().toLowerCase();
          });
          return Videos(
            id: video["url"] != null ? YoutubeService.getId(video["url"]!) : "",
            tag: tag,
            thumbNail: YoutubeService.getThumbnail(video["url"]!),
            url: video["url"]!,
          );
        }).toList();
    notifyListeners();
  }
}
