import 'package:flutter/material.dart';
import 'product_widget.dart';

class CatalogPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const CatalogPage({super.key, required this.data});

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  void _addToCart(int index) {
    setState(() {
      widget.data[index]['isInCart'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Каталог',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white, 
        iconTheme: const IconThemeData(color: Colors.black), 
      ),
      body: Container(
        color: Colors.white, 
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            return ProductWidget(
              title: widget.data[index]['title'],
              days: widget.data[index]['days'],
              price: widget.data[index]['price'].toDouble(),
              button: ElevatedButton(
                onPressed: () {
                  _addToCart(index); 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Добавить',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
