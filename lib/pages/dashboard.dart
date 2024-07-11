import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Center(
          child: Image.asset(
            'assets/shop.png',
            width: 150,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.purple[100],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/welcome.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterCarousel(
                options: CarouselOptions(
                  height: 400.0,
                  autoPlay: true,
                  showIndicator: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 700),
                  slideIndicator: CircularSlideIndicator(),
                ),
                items: [
                  'assets/awards.jpg',
                  'assets/armybomb.jpg',
                  'assets/album.jpg',
                  'assets/samsung.jpg',
                  'assets/tourmerch.jpg',
                  'assets/bt21.jpg',
                ].map((String imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 3.0,
        onTap: (int val){
          switch(val){
            case 0:
              Navigator.pushNamed(context, '/profile');
              break;
            case 1:
              Navigator.pushNamed(context, '/menu');
              break;
            case 2:
              Navigator.pushNamed(context, '/login');
              break;
          }
        },
        currentIndex: 0,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.purple),
              label: 'Profile'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_sharp, color: Colors.purple),
              label: 'Menu'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout, color: Colors.purple),
              label: 'Logout'

          ),
        ],
      ),
    );
  }
}