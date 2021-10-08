import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homehealth/src/bloc/register_profile_bloc.dart';
import 'package:homehealth/src/models/profile_model.dart';
import 'package:homehealth/src/pages/activities/activities_page.dart';
import 'package:homehealth/src/pages/activities/my_activities_page.dart';
import 'package:homehealth/src/pages/profile_page.dart';
import 'package:homehealth/src/providers/provider.dart';
import 'package:homehealth/src/providers/usuario_provider.dart';
import 'package:homehealth/src/widgets/background.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _listPages = [
    MyActivitiesPage(),
    ActivitiesPage(),
    ProfilePage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.registerProfile(
        context); //llamo al bloc para traer la infomracion guardada

    return Scaffold(
        body: Background(
          child: Center(child: _listPages.elementAt(_selectedIndex)),
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
        floatingActionButton: _crearBotones(bloc));
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  Widget _crearBotones(RegisterProfileBloc bloc) {
    switch (_selectedIndex) {
      case 0:
        return FloatingActionButton(
          onPressed: () => _saveActivity(context),
          child: Icon(Icons.add),
        );
        break;
      case 1:
        return Container();
      case 2:
        return FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'edit-profile');
          },
          child: Icon(Icons.edit),
        );
      default:
        return Container();
    }
  }

  Future<void> _saveActivity(BuildContext context) {
    Navigator.pushNamed(context, "manage-activity");
    // return showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   useSafeArea: false,
    //   useRootNavigator: false,
    //   builder: (BuildContext context) => AlertDialog(
    //     title: Text('Success!'),
    //     content: Text('You are in the football universe!'),

    //   )
    // );
  }
}
