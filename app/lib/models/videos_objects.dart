import 'package:app/models/videos.dart';
import 'package:flutter/material.dart';

class VideosObjects extends ChangeNotifier {
  List<Videos> videos;

  VideosObjects({required this.videos});

  addVideo(Videos video) {
    videos.add(video);
  }

  bool removeVideo(Videos video) {
    return videos.remove(video);
  }
}
