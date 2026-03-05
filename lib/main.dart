import 'package:flutter/material.dart';

import 'pages/models/vacancy.dart';
import 'screens/catalog_screen.dart';
import 'screens/favourites_screen.dart';
import 'screens/applications_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacancies Demo',
      theme: ThemeData(useMaterial3: true),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  late final List<Widget> _screens = const [
    CatalogScreen(),
    FavoritesScreen(),
    ApplicationsScreen(),
  ];

  String _titleByIndex(int index) {
    switch (index) {
      case 0:
        return 'Вакансии';
      case 1:
        return 'Избранное';
      case 2:
        return 'Отклики';
      default:
        return 'Vacancies Demo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleByIndex(_currentIndex)),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            label: 'Вакансии',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_outlined),
            label: 'Отклики',
          ),
        ],
      ),
    );
  }
}