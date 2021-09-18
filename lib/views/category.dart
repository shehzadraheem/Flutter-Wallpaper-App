import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/data/data.dart';
import 'package:flutter_wallpaper_app/model/wallpaper_model.dart';
import 'package:flutter_wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Category extends StatefulWidget {
  final String categoryName;

  Category({required this.categoryName});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  List<WallpaperModel> wallpapers = <WallpaperModel>[];
  getCategoryhWallpapers(String query) async{

    //"https://api.pexels.com/v1/search?query=nature&per_page=1"
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=15&page=1"),
        headers:{"Authorization":apiKey});

    Map<String,dynamic> jsonData = json.decode(response.body);
    jsonData["photos"].forEach((element){

      // here element is json data
      // we can't assign id or photographer  because we want wallpaperModel
      // but id or other things are just single value
      // so we will make factory method in WallpaperModel and provide jsondata and then fetch
      // complete WallpaperModel and then here we will add into wallpapers list and use it.
      var wallpaperModel = WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element); // here element is a Map
      // we use this map to get a model and then we will add into list
      wallpapers.add(wallpaperModel);
    });

    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getCategoryhWallpapers(widget.categoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView( // scroll view
        child: Container(
            child: Column(
              children: [
                wallpaperList(wallpapers: wallpapers,context: context),
              ],
            )
        ),
      ),
    );
  }
}
