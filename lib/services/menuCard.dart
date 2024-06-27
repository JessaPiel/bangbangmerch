import 'package:flutter/material.dart';
import 'package:bangbangmerch1/services/product.dart';

class MenuCard extends StatelessWidget {
final Product product;

MenuCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              product.productName,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            Text('${product.price}'),
          ],
        ),
      ),
    );
  }
}
