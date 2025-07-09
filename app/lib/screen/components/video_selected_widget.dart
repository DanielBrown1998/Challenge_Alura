import 'package:app/models/videos.dart';
import 'package:app/screen/theme/theme.dart';
import 'package:flutter/material.dart';

class VideoSelectedWidget extends StatefulWidget {
  final Videos video;

  const VideoSelectedWidget({super.key, required this.video});

  @override
  State<VideoSelectedWidget> createState() => _VideoSelectedWidgetState();
}

class _VideoSelectedWidgetState extends State<VideoSelectedWidget> {
  double scaleMyButton = 1;
  Color buttonColor = ChalengeColors.primaryColorButton;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .18,
          child: Image.network(
            widget.video!.thumbNail,
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
                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
    );
  }
}
