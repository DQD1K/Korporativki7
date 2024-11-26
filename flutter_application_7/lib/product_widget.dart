import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Название: ${product['title']}'),
            Text('Количество дней: ${product['days']}'),
            Text('Стоимость: \$${product['price']}'),
          ],
        ),
      ),
    );
  }
}
