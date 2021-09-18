import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/data/data.dart';
import 'package:flutter_wallpaper_app/model/category_model.dart';
import 'package:flutter_wallpaper_app/model/wallpaper_model.dart';
import 'package:flutter_wallpaper_app/views/category.dart';
import 'package:flutter_wallpaper_app/views/search.dart';
import 'package:flutter_wallpaper_app/widgets/widget.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> list = <CategoryModel>[];
  List<WallpaperModel> wallpapers = <WallpaperModel>[];
  TextEditingController searchController = new TextEditingController();

  getTrandingWallpapers() async{
    var response = await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=15&page=1"),
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
    getTrandingWallpapers();
    list = getCategories();
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
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff5f8fd),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 24.0),
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: 'search wallpaper',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search(searchQuery: searchController.text,)));
                        },
                        child: Container(
                            child: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0,),
                Container(
                height: 80.0,
                child: ListView.builder(itemCount: list.length,
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    shrinkWrap: true, // if you are using listview in column directly the use shrink
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                     return CategoryWidget(title: list[index].categoryName,
                     url: list[index].imgUrl,
                     );

                }),
              ),
                wallpaperList(wallpapers: wallpapers,context: context),
            ],
          )
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {

  final String title;
  final String url;

  CategoryWidget({required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Category(categoryName: title,)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(url,
               width: 100,
              height: 50,
              fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            Container(
              width: 100,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black26,
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

