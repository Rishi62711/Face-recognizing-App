import 'dart:io';
import 'dart:typed_data';
import 'package:cameraapp/screens/Person_Name.dart';
import 'package:dio/dio.dart' as d;
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;
  final String fileName;
  PreviewScreen({this.imgPath, this.fileName});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.file(
                  File(widget.imgPath),
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.black,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Name_of_Person()));
                        // print(widget.imgPath);
                        // print('name');
                        // print(widget.fileName);
                        //
                        // String path = widget.imgPath;
                        // var name = widget.fileName;
                        //
                        // d.FormData formData = d.FormData.fromMap(
                        //     {"img": await MultipartFile.fromPath(path, name)});
                        //
                        // d.Dio dio = new d.Dio();
                        // var respone = await dio.post<String>(
                        //     "http://10.0.2.2:5000/",
                        //     data: formData);
                        // if (respone.statusCode == 200) {
                        //   print('done');
                        // }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future getBytes() async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;
//    print(ByteData.view(buffer))
    return ByteData.view(bytes.buffer);
  }
}
