import 'package:ecommerce_app/details.dart';
import 'package:ecommerce_app/model/myproduct.dart';
import 'package:flutter/material.dart';

import '../Widget/productcard.dart';

Widget buildAllProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (2 / 3.5), // Adjusted aspect ratio for better fit
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.allProducts.length,
      itemBuilder: (context, index) {
        final allProducts = MyProduct.allProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(product: allProducts),
              ),
            );
          },
          child: ProductCard(product: allProducts),
        );
      },
    );
