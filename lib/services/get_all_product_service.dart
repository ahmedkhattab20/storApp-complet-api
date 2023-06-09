
import 'package:stor/models/product_model.dart';

import '../helper/api.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data  = await Api().get(url: 'https://fakestoreapi.com/products');
    print (' get all products/////////////////////////');
    print(data);

  List<ProductModel> productList = [];
  
  for (int i = 0; i < data.length; i++) {
    productList.add(
      ProductModel.fromJson(data[i]));
  }
  print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
   print (productList);
  return  productList;
  

  }
}
