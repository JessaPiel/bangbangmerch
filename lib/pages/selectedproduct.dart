import 'package:flutter/material.dart';
import 'package:mobile_appfront/services/product.dart';

class SelectedProduct extends StatefulWidget {
  final Product product;
  const SelectedProduct({super.key, required this.product});

  @override
  State<SelectedProduct> createState() => _SelectedProductState(product: product);
}

class _SelectedProductState extends State<SelectedProduct> {
  final Product product;
  late double totalAmount;
  int numberOfOrders = 1;

  _SelectedProductState({required this.product});


  @override
  void initState() {
    super.initState();
    totalAmount = product.price;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Order'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
        color: Colors.brown[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.network(widget.product.url),
                Text(
                  widget.product.productName,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.product.description,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₱ ${totalAmount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10.0,),
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        setState(() {
                          if(numberOfOrders > 1){
                            numberOfOrders -= 1;
                            totalAmount = product.price * numberOfOrders;
                          }
                        });
                      },
                      icon: Icon(Icons.remove),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.grey),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Text(
                      numberOfOrders.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    IconButton(
                      onPressed: (){
                        setState(() {
                          numberOfOrders += 1;
                          totalAmount = product.price * numberOfOrders;
                        });
                      },
                      icon: Icon(Icons.add),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.grey),
                      ),
                    ),

                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}