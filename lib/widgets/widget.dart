
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/model/wallpaper_model.dart';
import 'package:flutter_wallpaper_app/views/ImageView.dart';

Widget brandName(){
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
      children: const <TextSpan>[
        TextSpan(text: 'Wallpaper', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87)),
        TextSpan(text: 'Hub', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
      ],
    ),
  );
}

Widget wallpaperList({required List<WallpaperModel> wallpapers,context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 4.0),
    child: GridView.count(
      shrinkWrap: true, //If you do not set the shrinkWrap property, your ListView will be as big as its parent.
      // better explain  shrink (https://stackoverflow.com/questions/54007073/what-does-the-shrink-wrap-property-do-in-flutter)
        crossAxisCount: 2,// how many items you want to use 2 3 4 in row
        childAspectRatio: 0.6, // if we use 1 it mean square below 1  mean height increase above 1 mean width increase
        mainAxisSpacing: 6.0, //mean vertical spacing between childs
        crossAxisSpacing: 6.0, // mean horizontal space b/w childs
       // physics: ScrollPhysics(), // using for scrolling
        physics: ClampingScrollPhysics(),
      children: wallpapers.map((wallpaper){
        return GridTile(
         child: GestureDetector(
           onTap: (){
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => ImageView(img: wallpaper.src!.portrait!,)));
           },
           child: Hero( // Hero Animation
             tag: wallpaper.src!.portrait!,
             child: Container(
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(16),
                 child: Image.network(wallpaper.src!.portrait!,
                 fit: BoxFit.cover,
                 ),
               ),
             ),
           ),
         ),
        );
       }).toList(),
      ),
  );
}