
class WallpaperModel{

  String? photographer;
  String? photographer_url;
  int? photographer_id;
  SrcModel? src;

  WallpaperModel(
  {this.photographer, this.photographer_url, this.photographer_id, this.src});

  factory WallpaperModel.fromMap(Map<String,dynamic> jsonData){
    return WallpaperModel(
      photographer: jsonData["photographer"],
      photographer_url: jsonData["photographer_url"],
      photographer_id: jsonData["photographer_id"],
      src: SrcModel.fromMap(jsonData["src"])
    );
  }
}

class SrcModel{

  String? original;
  String? small;
  String? portrait;

  SrcModel({this.original, this.small, this.portrait});

  factory SrcModel.fromMap(Map<String,dynamic> jsonData){
    return SrcModel(
      original: jsonData["original"],
      small: jsonData["small"],
      portrait: jsonData["portrait"]
    );
  }
}