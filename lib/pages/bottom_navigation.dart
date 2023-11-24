import 'package:flutter/material.dart';
import 'package:unj_canteen/pages/canteen_list/blok_m_1.dart';
import 'package:unj_canteen/pages/canteen_list/daksin_barat.dart';

import 'settings_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0; // Index of the selected tab

  // Create a list of pages or widgets to display for each tab
  final List<Widget> _pages = [
    const DaksinBarat(),
    const BlokM1(),
    const SettingsPage(), // TODO third page
  ];

  void _onTabTapped(int index) {
    // Handle when a tab is tapped
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Bottom Navigation Bar Example'),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF16C8CF),
        selectedLabelStyle: TextStyle(color: Color(0xFF16C8CF)),
        unselectedItemColor: Color.fromARGB(255, 50, 47, 47),
        unselectedLabelStyle: TextStyle(color: Color.fromARGB(255, 50, 47, 47)),
        backgroundColor: Color(0xFF5B5B5B),
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Daksin',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
            ),
            label: 'Blok M',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
