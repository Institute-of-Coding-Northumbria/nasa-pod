import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_pod/error.dart';
import 'package:nasa_pod/nasapod.dart';
import 'package:nasa_pod/pod_card.dart';

void main() => runApp(MyApp());

Future<List<NasaPOD>> fetchPODs({final count = 5}) async {
  final response =
      await http.get("https://apodapi.herokuapp.com/api/?count=$count");
  if (response.statusCode == 200) {
    final jsonList = json.decode(response.body);
    if (jsonList is List) {
      return jsonList.map((json) => NasaPOD.fromJson(json)).toList();
    }
  }
  throw Exception('Failed to load PODs');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  final pods = fetchPODs();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Image.asset(
            "images/ioc-logo.png",
            height: 40.0,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
            future: widget.pods,
            builder:
                (BuildContext context, AsyncSnapshot<List<NasaPOD>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsets.all(12.0),
                  children: snapshot.data.map((pod) => PodCard(pod)).toList(),
                );
              } else if (snapshot.hasError) {
                return Error(error: snapshot.error);
              } else {
                return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.blue)));
              }
            }));
  }
}
