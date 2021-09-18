import 'package:flutter_wallpaper_app/model/category_model.dart';

 String apiKey = "563492ad6f917000010000019679bd0a291b4e75ae7568bef8289ddc";

List<CategoryModel> getCategories() {

  List<CategoryModel> categories = <CategoryModel>[];
  var categorieModel = CategoryModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoryName = "Street Art";
  categories.add(categorieModel);
  categorieModel =  CategoryModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoryName = "Wild Life";
  categories.add(categorieModel);
  categorieModel = new CategoryModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoryName = "Nature";
  categories.add(categorieModel);
  categorieModel = new CategoryModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoryName = "City";
  categories.add(categorieModel);
  categorieModel = new CategoryModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categorieModel.categoryName = "Motivation";

  categories.add(categorieModel);
  categorieModel = new CategoryModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoryName = "Bikes";
  categories.add(categorieModel);
  categorieModel = new CategoryModel();

  //
  categorieModel.imgUrl =
  "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categoryName = "Cars";
  categories.add(categorieModel);
  categorieModel = new CategoryModel();

  return categories;
}
