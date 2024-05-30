import 'package:flutter/material.dart';
//import 'package:kajian_sunnah/home/auth_page/login_signup.dart';
//import 'package:kajian_sunnah/home/auth_page/login.dart';
import 'package:kajian_sunnah/home/auth_page/login_signup.dart';
//import 'package:kajian_sunnah/home/auth_page/login_with_error_message.dart';
//import 'package:kajian_sunnah/home/auth_page/register.dart';
import 'package:kajian_sunnah/home/home_page/bookmark.dart';
import 'package:kajian_sunnah/home/home_page/home.dart';
import 'package:kajian_sunnah/home/home_page/module_post.dart';
import 'package:kajian_sunnah/home/home_page/notif.dart';
import 'package:kajian_sunnah/home/home_page/profile.dart';
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

  final List<Widget> _pages = [
    Home(
      topikService: TopikService(),
    ),
    Bookmark(),
    ModulePost(),
    Notif(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
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
        ],
        selectedItemColor: Color.fromRGBO(56, 28, 218, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}
