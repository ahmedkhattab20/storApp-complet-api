import 'package:flutter/foundation.dart';

class ProductModel {
   dynamic id;
   String title;
   var price;
   String description;
   String image;
   RatingModel rating;
   String  category;
  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.category,
      required this.description,
      required this.image,required this.rating});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData["id"],
        title: jsonData["title"],
        price: jsonData["price"],
        description: jsonData["description"],
        image: jsonData["image"],
        rating: RatingModel.fromJson(jsonData['rating']),
        category: jsonData["category"],

        );
  }
}
class RatingModel{
   var rate;
   var count;
  RatingModel({required this.rate,required this.count});
  factory RatingModel.fromJson(jsondData){
    return RatingModel(rate: jsondData["rate"], count: jsondData["count"]);
  }
}