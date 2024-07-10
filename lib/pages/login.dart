import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:mobile_appfront/services/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool _obscure = true;
  IconData _obscureIcon = Icons.visibility_off;
  Widget buttonContent =  Text('Log in');
  Widget loadingDisplay = CircularProgressIndicator();
  Future<bool>login(User user)async{
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/v1/auth/login'),
      headers: <String, String>{
    'Content-Type' : 'application/json; charset=UTF-8'
    },
      body: jsonEncode(<String,dynamic>{
        'usernameOrEmail': user.email,
        'password' : user.password
      }),
    );
    if (response.statusCode == 200){
      return true;
    }
    return false;
    // print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                  fontSize: 25.5,
                ),
              ),
              SizedBox(height: 10.0,),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text('Email'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please provide a valid email';
                        }
                        return null;
                      },
                      onSaved: (value){
                        email = value!;
                      },
                    ),
                    SizedBox(height: 30.0,),
                    TextFormField(
                      obscureText: _obscure,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        label: Text('Password'),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility_off_outlined),
                          onPressed: (){
                            setState(() {
                              _obscure=!_obscure;
                              if(_obscure){
                                _obscureIcon = Icons.visibility_off;
                              }else{
                                _obscureIcon = Icons.visibility_off;
                              }
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Please provide a password';
                        }
                        if(value.length < 8){
                          return 'Password should be atleast 8 characters long';
                        }
                        if(value.length > 20){
                          return 'Password should be atleast 20 characters long';
                        }
                        return null;
                      },
                      onSaved: (value){
                        password = value!;
                      },
                    ),
                    SizedBox(height: 30.0,),
                    ElevatedButton(
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          User user = User(
                            username: '',
                            email: email,
                            password: password,
                          );
                          // if login(user){
                          //   Navigator.pushReplacementNamed(context, '/');
                          // }
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
                      child: Text('Log In'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent[400],
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don`t have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        InkWell(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blue[400],
                            ),
                          ),
                          onTap: ()=> Navigator.popAndPushNamed(context, '/signup'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
