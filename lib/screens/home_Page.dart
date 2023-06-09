// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:stor/models/product_model.dart';
import 'package:stor/services/get_all_product_service.dart';
import 'package:stor/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "homePAge";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
          color: Colors.black,
        ),
        
          title: Text(
            "New Trend",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.cartArrowDown,
                  color: Color.fromARGB(255, 88, 88, 88),
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 13, right: 13, top: 50),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                         );
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
