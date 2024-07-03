import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
                children: [
                ElevatedButton(
                onPressed: (){
        Navigator.pushNamed(context, '/menu');
        },
          child: Text('go to menu'),
        ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/profile');
                },
                  child: Text('go to profile'),
                ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('go to login'),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text('go to signup'),
                  ),
              ],
            ),
          ),
        ),
    );

  }

}
