import 'package:flutter/material.dart';
class video extends StatefulWidget {
  const video({Key? key}) : super(key: key);

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('video player'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.lime,
      ),
    );
  }
}
