import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_downloader/image_downloader.dart';

class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  State<screen> createState() => _screenState();
}

late List listResponse =[];
int? position;
class _screenState extends State<screen> {
  late Map  mapResponse;








  // var Stringresponse;

  Future apicalling() async{
    http.Response response;
    response = await http.get(Uri.parse("https://clueinfotech.com/wallpaper/API/List_File_Upload.php?keyword_catname=Mahadev"));
    if(response.statusCode== 200){
      setState(() {
        // Stringresponse = response.body;
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['fileList'];
        // print('hello ${listResponse}');
      });
    }
  }
  @override
  void initState() {
    apicalling();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mahadev'),
      ),
      body:
      Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
            itemCount: listResponse.length,

            itemBuilder:(context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    // flex: 1,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(listResponse[index]['file_thumb']),fit: BoxFit.cover,),
                          border: Border.all(color: Colors.red,width: 2),
                          borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    image_download(index);

                  },child: Text("dowanload")),
                ],
              );
            } ,)



          // }).toList(),
        // ),

      ),
    );
  }
  image_download( int index) async {
    try {
      // Saved with this method.
      // print("list===${listResponse}");
      // print("listindex===${index}");
      var imageId = await ImageDownloader.downloadImage(listResponse[index]['file_thumb'],destination: AndroidDestinationType.directoryDownloads
        ..subDirectory(listResponse[index]['file_name']),);
      // print("imageid==${imageId}");
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } on PlatformException catch (error) {
      print(error);
    }
  }
}

