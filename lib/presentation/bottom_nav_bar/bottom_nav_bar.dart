import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:tax_advisory_app/presentation/app_in_screen/app_in_screen.dart';
import 'package:tax_advisory_app/presentation/profile/profile_screen.dart';
import 'package:tax_advisory_app/presentation/settings/settings.dart';

import '../activities/activities.dart';
import '../home_screen/home_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AppInScreen(),
    ActivitiesScreen(),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return StylishBottomBar(
      option: DotBarOptions(
        dotStyle: DotStyle.tile,
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.black,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      items: [
        BottomBarItem(
          icon: Icon(Icons.home_filled),
          title: Text('Home'),
          backgroundColor: Colors.blue,
        ),
        BottomBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Activities'),
          backgroundColor: Colors.blue,
        ),
        BottomBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          backgroundColor: Colors.blue,
        ),
        BottomBarItem(
          icon: Icon(Icons.perm_identity),
          title: Text('Profile'),
          backgroundColor: Colors.blue,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
