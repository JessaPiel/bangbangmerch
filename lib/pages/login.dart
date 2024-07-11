import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_appfront/services/user.dart';

class Login  extends StatefulWidget {
  const Login ({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;

  Widget buttonContent = Text('Login');

  Widget loadingDisplay = CircularProgressIndicator();

  Future<bool> login(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
        'Content-Type' : 'Application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, dynamic>{
        'usernameOrEmail' : user.email,
        'password' : user.password
      }),
    );
    if (response.statusCode ==200){
      return true;
    }
    return false;
    //print(response.body);
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
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.0,
                    fontSize: 25.7,
                  ),
                ),
                SizedBox(height: 30.0,),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            label: Text('Email'),
                            filled: true,
                            fillColor: Colors.white70,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            prefixIcon: Icon(Icons.email_outlined)
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please provide a name!';
                          }
                          if (value.length < 2) {
                            return ' ame should be atleast 8-20 letters long';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      SizedBox(height: 30.0,),
                      TextFormField(
                        obscureText: _obscure,
                        maxLength: 60,
                        decoration: InputDecoration(
                          label: Text('Password'),
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: Icon(Icons.lock),
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
                        ),
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please provide a password!';
                          }
                          if(value.length < 8){
                            return 'Password should be atleast 8 letters long';
                          }
                          if(value.length >20) {
                            return 'Password should be atleast 20 letters long';
                          }
                          return null;
                        },
                        onSaved: (value){
                          password = value!;
                        },
                      ),
                      SizedBox(height: 25.0,),
                      ElevatedButton(
                        onPressed: (){
                          if(formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            User user = User(
                              username: '',
                              email: email,
                              password: password,
                            );
                            /*if(login(user)) {
                              Navigator.pushReplacementNamed(context, '/dashboard');
                            }*/
                            setState(() {
                              buttonContent = FutureBuilder(
                                  future: login(user),
                                  builder: (context, snapshots){
                                    if(snapshots.connectionState == ConnectionState.waiting){
                                      return loadingDisplay;
                                    }
                                    if(snapshots.hasData){

                                    }
                                    return Text('Log in');
                                  }
                              );
                            });
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                        child: buttonContent,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[200],
                          foregroundColor: Colors.black,
                        ),

                      ),
                      SizedBox(height: 30.0,),
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
                      SizedBox(height: 20.0,),
                      ElevatedButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.g_mobiledata),
                        label: Text('Sign in with Google'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red[900],
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      ElevatedButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.facebook),
                        label: Text('Sign in with Facebook'),
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
                            'Don\'t have an account? ',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          InkWell(
                            child: Text(
                              'Sign Up Here',
                              style: TextStyle(
                                  color: Colors.blue
                              ),
                            ),
                            onTap: () => Navigator.popAndPushNamed(context, '/signup'),
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