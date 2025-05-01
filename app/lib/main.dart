import 'package:flutter/material.dart';
import 'package:app/screen/home.dart';
import 'package:provider/provider.dart';
import 'package:app/models/tags_objects.dart';
import 'package:app/models/videos_objects.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TagsObjects()),
        ChangeNotifierProvider(create: (_) => VideosObjects(videos: [])),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: "/",
      routes: {"/": (context) => HomePage(title: "MOBFLIX")},
    );
  }
}
