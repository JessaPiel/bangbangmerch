import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../services/User.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}



class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  createAccount(User user) async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/register/user'),
      headers : <String, String>{
        'Content-Type' : 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'username' : user.username,
        'email' : user.email,
        'password' : user.password,
      }),
    );
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.purple[100],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/The Art of Living.png'),
                fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(15.0, 50.0, 10.0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 150.0,),
                Text(
                  'Let\'s Get Started!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2.0,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 40.0),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('Name'),
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a name';
                          }
                          if (value.length < 2) {
                            return 'Name should be at least 2 letters long';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          name = value!;
                        },
                      ),

                      SizedBox(height: 30.0),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text('Email'),
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide an email!';
                          }
                          if (value.length < 5) {
                            return 'Email should be at least 5 letters long';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      SizedBox(height: 30.0),
                      TextFormField(
                        maxLength: 20,
                        enableInteractiveSelection: false,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          label: Text('Password'),
                          filled: true,
                          fillColor: Colors.white70,
                          prefixIcon: Icon(Icons.lock_rounded),
                          suffixIcon: IconButton(
                            icon: Icon(_obscureIcon),
                            onPressed: (){
                              setState(() {
                                _obscure = !_obscure;
                                if(_obscure){
                                  _obscureIcon = Icons.visibility_off;
                                }else{
                                  _obscureIcon = Icons.visibility;
                                }
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a password!';
                          }
                          if (value.length < 8) {
                            return 'Password should be at least 8 letters long';
                          }
                          if (value.length > 20) {
                            return 'Password should be at most 20 letters long';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      SizedBox(height: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            User user = User(
                                username: name,
                                email: email,
                                password: password
                            );
                            createAccount(user);
                            Navigator.pushReplacementNamed(context, '/login');
                          }
                        },
                        child: Text('Create Account'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[200],
                          foregroundColor: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'or login with',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.g_mobiledata),
                        label: Text('Login with Google'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red[900],
                        ),
                      ),
                      SizedBox(height: 15.0),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.facebook),
                        label: Text('Login with Facebook'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue[900],
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 2.0,),
                          InkWell(
                            child: Text(
                              'Login Here',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                            onTap: () => Navigator.popAndPushNamed(context, '/login'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}