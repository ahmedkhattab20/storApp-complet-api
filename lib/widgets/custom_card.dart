import 'package:flutter/material.dart';
import 'package:stor/models/product_model.dart';

import '../screens/update_product_page.dart';

class CustomCard extends StatelessWidget {
   CustomCard({required this.product
  });
 
ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id,arguments: product); 
      },
      child: Stack(
        children: [
          Container(
            
            decoration: BoxDecoration(
            
              boxShadow: [
              BoxShadow(
                  blurRadius: 30,
                  color:
                      const Color.fromARGB(255, 105, 104, 104).withOpacity(0.1),
                  offset: Offset(10, 10),
                  spreadRadius: 0),
                  
            ]),
            child: Card(
              shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
      ),
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      product.title.substring(0,18),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${product.price.toString()}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.favorite_rounded,
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          
          Positioned(
            top: 20,
            left: 10,
            right: 10,
            
            child: Image.network(
              product.image,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
