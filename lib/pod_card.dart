import 'package:flutter/material.dart';
import 'package:image_ink_well/image_ink_well.dart';
import 'package:nasa_pod/detail.dart';
import 'package:nasa_pod/nasapod.dart';

class PodCard extends StatelessWidget {
  final NasaPOD pod;

  const PodCard(this.pod, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 18.0,
      margin: EdgeInsets.all(12.0),
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Stack(children: <Widget>[
        Container(
          width: 400.0,
          height: 250.0,
          child: Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.blue))),
        ),
        Hero(
          tag: pod.url,
          child: RoundedRectangleImageInkWell(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(pod: pod)));
            },
            borderRadius: BorderRadius.circular(12.0),
            height: 250.0,
            width: 400.0,
            fit: BoxFit.cover,
            backgroundColor: Colors.transparent,
            image: NetworkImage(pod.url),
          ),
        ),
      ]),
    );
  }
}
