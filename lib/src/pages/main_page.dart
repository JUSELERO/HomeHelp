import 'package:flutter/material.dart';
import 'package:homehealth/src/widgets/background.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _listPages = [
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Center(
          child: _listPages.elementAt(_selectedIndex)
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Mis Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Actividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Perfil',
          ),
        ],
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}