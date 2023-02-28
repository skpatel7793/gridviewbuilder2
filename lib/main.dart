import 'package:flutter/material.dart';
import 'package:gridviewbuilder/video.dart';
import 'package:http/http.dart' as http;
import 'screen.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'apicallin list view',
      home: screen(),
    );
  }
}
