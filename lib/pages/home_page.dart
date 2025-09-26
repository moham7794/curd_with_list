import 'package:flutter/material.dart';
import '../consts/app_consts.dart';
import 'crud_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    CRUDPage(),
    Center(child: Text('صفحة البحث')), 
    Center(child: Text('صفحة الملف الشخصي')), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'القائمة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'البحث',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'الملف الشخصي',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.grey,
          onTap: _onItemTapped,
          backgroundColor: AppColors.white.withOpacity(0.95),
          elevation: 10,
        ),
      ),
    );
  }
}