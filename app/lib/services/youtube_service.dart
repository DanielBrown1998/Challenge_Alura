import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import "package:app/urls.dart" as gists;

class YoutubeService {
  static Future<List<dynamic>> getVideos() async {
    http.Response response = await http.get(
      Uri.parse(gists.url),
      headers: {"Authorization": "Bearer ${gists.token}"},
    );
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> videos = json.decode(
      map["files"]["playlist.json"]["content"],
    );
    return videos;
  }

  static String getId(String url) {
    return YoutubePlayer.convertUrlToId(url) ?? "";
  }

  static String getThumbnail(String url) {
    final id = getId(url);
    return "https://img.youtube.com/vi/$id/0.jpg";
  }

  static String getVideoUrl(String url) {
    final id = getId(url);
    return "https://www.youtube.com/watch?v=$id";
  }
}
