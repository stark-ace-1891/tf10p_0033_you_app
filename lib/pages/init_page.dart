import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    Center(
      child: Text(
        "Principal",
      ),
    ),
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
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff212121),
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
