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
              ],
            ),
          ),
        ),
    );

  }

}
