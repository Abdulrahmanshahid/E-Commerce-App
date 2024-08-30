import 'package:ecommerce_app/Widget/productcard.dart';
import 'package:ecommerce_app/details.dart';
import 'package:ecommerce_app/model/myproduct.dart';
import 'package:flutter/material.dart';

buildMarriageHall() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (120 / 160), // Corrected typo
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProduct.marraigeHallList.length,
      itemBuilder: (BuildContext context, int index) {
        final marriageHallList = MyProduct.marraigeHallList[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: marriageHallList)));
          },
          child: ProductCard(
            product: marriageHallList,
          ),
        );
      },
    );
