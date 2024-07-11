import 'package:flutter/material.dart';
import 'package:mobile_appfront/services/product.dart';

class Menucard extends StatelessWidget {
  final Product product;

  Menucard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[400],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              product.productName,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),

            ),
            Text(
              '${product.price}',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}