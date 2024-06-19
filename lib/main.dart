import 'package:flutter/material.dart';

void main() {
  var deepPurpleurple;
  runApp(MaterialApp(
    home:Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BangBangMerch'),
        ),
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Center(
        child: Image.network('https://i.pinimg.com/564x/4e/2c/87/4e2c87ad35023d43e6118168dcda38f9.jpg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pinkAccent[100],
        child: Icon(
          Icons.add_box_rounded,
          color: Colors.deepPurple,
        ),
      ),
    ),
  ),
  );
}