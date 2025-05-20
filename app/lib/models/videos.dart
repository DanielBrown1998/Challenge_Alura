import 'package:app/models/tags.dart';

class Videos {
  Videos({
    required this.id,
    required this.tag,
    required this.thumbNail,
    required this.url,
  });
  final String id;
  final String url;
  final String thumbNail;
  final Tags tag;
}
