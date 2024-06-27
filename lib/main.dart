import 'package:flutter/material.dart';
import 'package:kajian_sunnah/home/auth_page/login_signup.dart';
import 'package:kajian_sunnah/home/home_page/bookmark.dart';
import 'package:kajian_sunnah/home/home_page/home.dart';
import 'package:kajian_sunnah/home/home_page/module_post.dart';
import 'package:kajian_sunnah/home/home_page/notif.dart';
import 'package:kajian_sunnah/home/home_page/profile.dart';
import 'package:kajian_sunnah/service/category_service.dart';
import 'package:kajian_sunnah/service/ustadz_service.dart';
import 'package:kajian_sunnah/service/topik_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Signup(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _selectedIndex = 0;
  final List<String> _appBarTitles = [
    'Kajian Sunnah',
    'Bookmark',
    'Module',
    'Notif',
    'Profile'
  ];

  final List<Widget> _pages = [
    Home(
      topikService: TopikService(),
      ustadzService: UstadzService(),
      categoryService: CategoryService(),
    ),
    Bookmark(),
    ModulePost(),
    Notif(),
    Profile(),
  ];
  final List<BottomNavigationBarItem> _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.library_books_sharp),
      label: 'Bookmark',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      label: 'Module',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notif',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined),
      label: 'Profil',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.grid_view,
        ),
        title: Text(
          _appBarTitles[_selectedIndex],
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontFamily: 'ProzaLibre-Bold',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
              ),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: _bottomNavigationBarItems,
        selectedItemColor: Color.fromRGBO(56, 28, 218, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
