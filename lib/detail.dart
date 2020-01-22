import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasa_pod/nasapod.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPage extends StatelessWidget {
  final NasaPOD pod;

  const DetailPage({Key key, this.pod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pod.title), backgroundColor: Colors.black),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(child: Center(child: CircularProgressIndicator())),
              Hero(
                tag: pod.url,
                child: FadeInImage.memoryNetwork(
                    fit: BoxFit.contain,
                    placeholder: kTransparentImage,
                    image: pod.url),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(pod.date, style: Theme.of(context).textTheme.caption),
                Container(
                  width: 200.0,
                  child: Text("© ${pod.copyright}",
                      softWrap: true,
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.caption),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
            child: Text(
              pod.description,
              strutStyle: StrutStyle(height: 1.6),
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .copyWith(fontSize: 16.0, fontFeatures: [
                FontFeature.tabularFigures(),
                FontFeature.oldstyleFigures(),
                FontFeature.proportionalFigures()
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
