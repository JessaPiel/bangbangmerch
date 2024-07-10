import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_appfront/pages/selectedProduct.dart';
import 'package:mobile_appfront/services/product.dart';
import 'package:mobile_appfront/services/menuCard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late Future<List<dynamic>> products;
  Future <List<dynamic>> fetchData() async{
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8080/api/v1/products/all')
    );
    final data = jsonDecode(response.body);
    List products = <Product>[];
    for(var product in data){
      products.add(Product.fromJson(product));
    }
    //Product newProduct = Product.fromJson(data);
    // return newProduct;
    return products;
  }

  @override
  void initState() {
    super.initState();
    products = fetchData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.black,
        title: Text(
          'Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,

          ),
        ),
        centerTitle: true,

      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: FutureBuilder(
              future: products,
              builder: (context, snapshots){
                if(snapshots.connectionState == ConnectionState.waiting){
                  return Center(
                    child: SpinKitThreeBounce(
                      color: Colors.purple,
                      size: 60.0,
                    ),
                  );
                }
                if(snapshots.hasData) {
                  List products = snapshots.data!;
                  return Padding(
                    padding: EdgeInsets.all(3.0),
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.purpleAccent,
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    products[index].productName,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(products[index].price.toString()),
                                ],
                              ),
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectedProduct(product: products[index]),
                                    )
                                );
                              },

                            ),
                          );
                        }
                    ),
                  );
                }
                return Center(
                  child: Text('Unable to load data'),
                );
              }
          )
      ),
    );
  }
}