import 'package:flutter/material.dart';
import 'package:stor/screens/home_Page.dart';
import 'package:stor/screens/update_product_page.dart';

void main() {
  runApp(const StorApp());
}

class StorApp extends StatelessWidget {
  const StorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (ContinuousRectangleBorder) => UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
