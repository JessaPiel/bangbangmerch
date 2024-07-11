import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.purple[100],
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/5907202.png'),
                        backgroundColor: Colors.purple[100],
                        radius: 50.0,
                      ),
                    ),
                  ),
                  Divider(
                    height: 55.0,
                    color: Colors.purpleAccent,
                    thickness: 5.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.person_2,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'NAME',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Jessa Piel C. Flores',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_sharp,
                        color: Colors.white,
                      ),
                      Text(
                        'YEAR',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '$year Year',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'ADDRESS',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Balayan, Batangas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'STATUS',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Single',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        'EMAIL',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '21-11089@g.batstate-u.edu.ph',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'CONTACT NUMBER',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '09123816433',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),

                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        year += 1;
                      });
                    },
                    child: Text('Add Year'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple[100]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}