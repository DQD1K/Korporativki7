import 'package:flutter/material.dart';
import 'catalog_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';
import 'product_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  // Массив данных
  final List<Map<String, dynamic>> _data = [
    {
      'title': 'ПЦР-тест на определение РНК коронавируса стандартный',
      'days': 2,
      'price': 1800,
    },
    {
      'title': 'Клинический анализ крови с лейкоцитарной формулировкой',
      'days': 2,
      'price': 690,
    },
    {
      'title': 'Биохимический анализ крови, базовый',
      'days': 1,
      'price': 2440,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pages = [
      CatalogPage(data: _data),
      CartPage(),
      ProfilePage(),
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
      appBar: AppBar(),
      body: _pages[_selectedIndex], // Отображение выбранной страницы
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
