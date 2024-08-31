import 'package:ecommerce_app/cart.dart';
import 'package:ecommerce_app/methods/buildhotels.dart';
import 'package:flutter/material.dart';

import 'methods/buildmarriages.dart';
import 'methods/gridview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'E-Commerce Shop',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartDetails()));
              },
              icon: Icon(Icons.add_shopping_cart)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Our Products",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildProductCategory(index: 0, name: "All"),
                  buildProductCategory(index: 1, name: "Boots"),
                  buildProductCategory(index: 2, name: "Sneakers"),
                ],
              ),
            ),
            Expanded(
              child: isSelected == 0
                  ? buildAllProducts()
                  : isSelected == 1
                      ? buildMarriageHall()
                      : buildHotels(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCategory({required int index, required String name}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 50,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.red.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
