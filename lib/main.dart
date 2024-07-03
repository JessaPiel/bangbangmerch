import 'package:bangbangmerch1/home.dart';
import 'package:bangbangmerch1/pages/dashboard.dart';
import 'package:bangbangmerch1/pages/menu.dart';
import 'package:bangbangmerch1/pages/signup.dart';
import 'package:bangbangmerch1/pages/login.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/menu',
    routes: {
      '/' :(context) => Dashboard(),
      '/menu' : (context) => Menu(),
      '/profile' : (context) => Home(),
      '/signup' : (context) => Signup(),
      '/login' : (context) => Login(),
    },
  ));
