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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        foregroundColor: Colors.white,
        title: Text("Dashboard",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Image.asset(
            'assets/bangbanglogo.png',
            height: 200.0,
            width: double.infinity,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3.0,
        onTap: (int val){
          switch (val){
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/menu');
              break;
            case 2:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        currentIndex: 0,
        selectedItemColor: Colors.purple[600],
        items: [
      BottomNavigationBarItem(
      icon: Icon(Icons.home,
        color: Colors.brown[900],
      ),

        label: 'Home'
    ),
      BottomNavigationBarItem(
      icon: Icon(Icons.paste,
        color: Colors.brown[900],
    ),
    label: 'Products'
    ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_pin,
          color: Colors.brown[900],
    ),
    label: 'Profile'
    ),
    ]
    ),
    );
  }
}