import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/pages/home_page.dart';
import 'package:tf10p_0033_you_app/ui/general/colors.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    HomPage(),
    Center(
      child: Text(
        "Shorts",
      ),
    ),
    Center(
      child: Text(
        "Agregar",
      ),
    ),
    Center(
      child: Text(
        "Suscripcion",
      ),
    ),
    Center(
      child: Text(
        "Biblioteca",
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBrandPrimaryColor,
        title: Image.asset(
          'lib/assets/images/logo.png',
          height: 26,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.cast),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.notifications_none),
                Positioned(
                  top: -2,
                  right: -4,
                  child: Container(
                    padding: EdgeInsets.all(2.4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      "9+",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          SizedBox(
            width: 6,
          ),
          CircleAvatar(
            backgroundColor: Colors.white12,
            radius: 14,
            backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/1040880/pexels-photo-1040880.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            ),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kBrandPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: _currentIndex,
        onTap: (int value) {
          _currentIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType
            .fixed, //Usado para mostrar mas de 3 opciones
        items: [
          BottomNavigationBarItem(
            label: "Principal",
            icon: Icon(
              Icons.home_filled,
            ),
          ),
          BottomNavigationBarItem(
            label: "Shorts",
            icon: Icon(
              Icons.play_arrow_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              margin: EdgeInsets.only(
                top: 4,
              ),
              child: Icon(
                Icons.add_circle_outline,
                size: 30,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Suscripciones",
            icon: Icon(
              Icons.subscriptions_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(
              Icons.video_collection_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
