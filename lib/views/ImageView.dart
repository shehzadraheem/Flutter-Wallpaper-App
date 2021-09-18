import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {

  final String img;
  ImageView({required this.img});

  @override
  _ImageViewState createState() => _ImageViewState();
}
class _ImageViewState extends State<ImageView> {

  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.img,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.network(widget.img,
              fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    _save();
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff1c1B1B).withOpacity(0.8),
                        ),
                        width: MediaQuery.of(context).size.width/2,
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2,
                        padding:EdgeInsets.symmetric(horizontal: 8,vertical: 8) ,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white54,width: 1),
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              colors: [
                                Color(0x36FFFFFF),
                                Color(0x0FFFFFFF),
                              ]
                          ),
                        ),
                        child: Column(
                          children: [
                            Text('Set Wallpaper', style: TextStyle(fontSize: 16,color: Colors.white70),),
                            Text('Image will be saved in Gallery', style: TextStyle(fontSize: 10,color: Colors.white70),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Text(
                  'cancel',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _save() async {
    if(Platform.isAndroid) {
      await _askPermission();
    }
    var response = await Dio().get(widget.img,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    // if (Platform.isIOS) {
    //   Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler()
    //       .requestPermissions([PermissionGroup.photos]);
    // } else {
    //    PermissionStatus permission = await PermissionHandler()
    //       .checkPermissionStatus(PermissionGroup.storage);
    // }

    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    print(info);
  }

}
