import 'package:flutter/material.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      print('Email: ${_emailController.text}');
      print('Password: ${_passwordController.text}');
    }
  }

  void _navigateToSignup(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signup())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text(
            'Welcome Back!',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              letterSpacing: 2.0,
              fontSize: 24.5,
            ),
          ),
          SizedBox(height: 30.0),
         Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30.0),
                TextFormField(
                  decoration:InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  obscureText: true,
                  decoration:InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please provide a Password';
                    }
                    if (value.length < 8){
                      return 'Password should be at least 8 characters long';
                    }
                    if (value.length > 20){
                      return 'Password must be 20 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _login,
                  child: Text('Login'),
                ),
                SizedBox(height: 20),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text(
                     'Don\'t have an Account?',
                         style: TextStyle(
                        color: Colors.black,
               )
                   ),
                 ],
               ),
                InkWell(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: _navigateToSignup,
                ),
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