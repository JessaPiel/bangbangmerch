import 'package:bangbangmerch1/home.dart';
import 'package:bangbangmerch1/pages/dashboard.dart';
import 'package:bangbangmerch1/pages/menu.dart';
import 'package:bangbangmerch1/pages/signup.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/signup',
    routes: {
      '/' :(context) => Dashboard(),
      '/menu' : (context) => Menu(),
      '/profile' : (context) => Home(),
      '/signup' : (context) => Signup(),
    },
  ));
