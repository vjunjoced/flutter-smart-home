import 'package:flutter/material.dart';
import 'package:smart_home_iot/src/pages/home_page.dart';

import '../app_colors.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final listPages = [HomePage()];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: listPages,
      ),
      extendBody: true,
      backgroundColor: AppColors.bodyColor,
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    final _borderRadius = BorderRadius.only(
      topRight: Radius.circular(20.0),
      topLeft: Radius.circular(20.0),
    );

    return Container(
      height: 70.0,
      child: ClipRRect(
        borderRadius: _borderRadius,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.mainColor,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            _itemMenu(Icons.home),
            _itemMenu(Icons.timer),
            _centerMenu(Icons.add),
            _itemMenu(Icons.show_chart),
            _itemMenu(Icons.settings),
          ],
          onTap: (int index) {
            setState(() {
              _selectedIndex = 0;
            });
          },
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }

  BottomNavigationBarItem _itemMenu(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 24.0,
      ),
      title: Container(),
    );
  }

  BottomNavigationBarItem _centerMenu(IconData icon) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.mainColor,
        ),
        width: 45.0,
        height: 45.0,
        child: Icon(
          icon,
          size: 30.0,
          color: Colors.white,
        ),
      ),
      title: Container(),
    );
  }
}
