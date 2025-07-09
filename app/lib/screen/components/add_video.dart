import 'package:app/models/tags.dart';
import 'package:app/models/tags_objects.dart';
import 'package:app/models/videos.dart';
import 'package:app/screen/components/app_bar_mobflix.dart';
import 'package:app/services/youtube_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddVIdeoScreen extends StatefulWidget {
  const AddVIdeoScreen({super.key});

  @override
  State<AddVIdeoScreen> createState() => _AddVIdeoScreenState();
}

class _AddVIdeoScreenState extends State<AddVIdeoScreen> {
  final formKey = GlobalKey<FormState>();
  String id = "";
  Tags? tag;
  String thumbNail = "";
  bool visible = false;
  TextEditingController url = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TagsObjects tagsObjects = Provider.of<TagsObjects>(context, listen: false);
    return Scaffold(
      appBar: AppBarMobflix.appBar("Add Video"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ignore: unnecessary_null_comparison

              // ignore: unnecessary_null_comparison
              SizedBox(
                height: 80,
                child: Visibility(
                  visible: visible,
                  child: Text("ID: ${YoutubeService.getId(url.text)}"),
                ),
              ),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 30,
                  children: [
                    TextFormField(
                      controller: url,
                      onChanged: (value) {
                        setState(() {
                          id = YoutubeService.getId(value);
                          thumbNail = YoutubeService.getThumbnail(url.text);
                          visible = true;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Insira a url do Video",
                      ),
                    ),
                    DropdownButtonFormField(
                      items: List.generate(tagsObjects.tags.length, (values) {
                        return DropdownMenuItem(
                          value: tagsObjects.tags[values],
                          child: Text(tagsObjects.tags[values].tagName),
                        );
                      }),
                      onChanged: (value) {
                        tag = value;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Form is valid, do something
                          if (url.text.isNotEmpty &&
                              id.isNotEmpty &&
                              tag != null &&
                              thumbNail.isNotEmpty) {
                            Videos video = Videos(
                              id: id,
                              tag: tag!,
                              url: url.text,
                              thumbNail: thumbNail,
                            );
                            Navigator.pop(context, video);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Os campos nao foram preenchidos corretamente!",
                                ),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Os campos nao sao validos!"),
                            ),
                          );
                        }
                      },
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              ),
              Center(
                child:
                    (visible)
                        ? Image.network(
                          thumbNail,
                          height: 300,
                          width: 400,
                          errorBuilder: (context, error, stackTrace) {
                            return FlutterLogo();
                          },
                        )
                        : SizedBox(
                          height: 100,
                          width: 100,
                          child: Icon(Icons.youtube_searched_for_outlined),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
