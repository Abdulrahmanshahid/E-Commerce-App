import 'package:ecommerce_app/provider/favorite_provider.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                  onTap: () => provider.toggleFavorites(widget.product),
                  child: Icon(
                      provider.isExist(widget.product)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: Colors.red)),
            ],
          ),
          SizedBox(
            height: 140,
            width: 130,
            child: Image.asset(
              widget.product.image,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: Text(
              widget.product.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis, // Ellipsis for long names
            ),
          ),
          Flexible(
            child: Text(
              widget.product.category,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, color: Colors.red),
              overflow: TextOverflow.ellipsis, // Ellipsis for long categories
            ),
          ),
          Text(
            '\$${widget.product.price}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
