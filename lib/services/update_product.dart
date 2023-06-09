import 'package:stor/models/product_model.dart';

import '../helper/api.dart';

class UpdatProductService {
  Future<ProductModel> updateProduct(
      {required String title,
      required String price,
      required String description,
      required String image,
      required String category ,
      required int id,
      }) async {
        print("produc id = $id");
        print ("responce //////from//////api ");

    Map<String, dynamic> data = await Api().put(
  url: 'https://fakestoreapi.com/products/$id',
  body: {
    "title": title,
    "price": price,
    "description": description,
    "image": image,
    "category": category
  },
);
print('Response from API: $data');

return ProductModel.fromJson(data);
  }
}
