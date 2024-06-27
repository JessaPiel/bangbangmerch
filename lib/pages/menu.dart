import 'package:flutter/material.dart';
import 'package:bangbangmerch1/services/product.dart';
import 'package:bangbangmerch1/services/menuCard.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  List products = <Product>[
    Product(productName: "Deluxe Burger", price: 50.00),
    Product(productName: "Super Deluxe Burger", price: 60.00),
    Product(productName: "Double Deluxe Burger", price: 70.00),
    Product(productName: "Cheesy Deluxe Burger", price: 80.00),
    Product(productName: "Double Cheesy Deluxe Burger", price: 90.00),
  ];

  Widget cardTemplate(product){
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[100],
        foregroundColor: Colors.black,
        title: Text(
          'Menu',
              style: TextStyle(
            fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
        ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: products.map((product) => MenuCard(product: product)).toList(),
        ),
      )
    );
  }
}

