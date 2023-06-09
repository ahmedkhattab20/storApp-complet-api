// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:stor/models/product_model.dart';
import 'package:stor/services/update_product.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});
  static String id = "update product";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;

  var price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments
        as ProductModel; //استقبال بيانات البرودكت
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Updat product",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              CustomTextField(
                onChanged: (data) {
                  productName = data;
                },
                hintText: " title",
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (data) {
                  description = data;
                },
                hintText: " description",
                // inputType: TextInputType.name
              ),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                  onChanged: (data) {
                    price = data; // int.parc(data لو حصل مشكله يعني )
                  },
                  hintText: " price",
                  inputType: TextInputType.number),
              SizedBox(
                height: 15,
              ),
              CustomTextField(
                onChanged: (data) {
                  image = data;
                },
                hintText: " image",
              ),
              SizedBox(
                height: 100,
              ),
              CustomButton(
                  text: "Update ",
                  color: Colors.blueAccent,
                  onTap: ()async {
                    isLoading = true;
                    setState(() {});
                    try {
                       await  updateproductMethod(product);

                      print("success");
                    } catch (e) {
                      print(e.toString());

                      
                    }
                    isLoading = false;
                      setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void > updateproductMethod(ProductModel product)async {
    await UpdatProductService().updateProduct( id: product.id,
        title: productName==null ?product.title: productName!,
        price: price==null ?product.price.toString(): price!,
        description: description==null ?product.description: description!,
        image: image==null ?product.image: image!,
        category: product.category);
  }
}
