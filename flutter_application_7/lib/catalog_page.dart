import 'package:flutter/material.dart';
import 'product_widget.dart';

class CatalogPage extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  CatalogPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Каталог')),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0), // Отступы вокруг контейнера
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2), // Цвет и ширина границы
              borderRadius: BorderRadius.circular(8.0), // Закругление углов
              color: Colors.white, // Цвет фона
            ),
            child: ListTile(
              title: Text(data[index]['title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
                children: [
                  Text('${data[index]['days']} день'),
                  Text('${data[index]['price']}₽'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(product: data[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
