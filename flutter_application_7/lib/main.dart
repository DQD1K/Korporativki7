import 'package:flutter/material.dart';
import 'catalog_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  final List<Map<String, dynamic>> _data = [
    {
      'title': 'ПЦР-тест на определение РНК коронавируса стандартный',
      'days': 2,
      'price': 1800,
      'isInCart': false,
      'quantity': 1,
    },
    {
      'title': 'Клинический анализ крови с лейкоцитарной формулировкой',
      'days': 2,
      'price': 690,
      'isInCart': false, 
      'quantity': 1,
    },
    {
      'title': 'Биохимический анализ крови, базовый',
      'days': 1,
      'price': 2440,
      'isInCart': false, 
      'quantity': 1,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      CatalogPage(data: _data),
      CartPage(data: _data), 
      const ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, 
      ),
      body: Container(
        color: Colors.white, 
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
