import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final String title;
  final int days;
  final double price;
  final Widget button;

  const ProductWidget({
    super.key, 
    required this.title,
    required this.days,
    required this.price,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.white, 
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 8.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    Text('$days ${days == 1 ? 'день' : 'дня'}'), 
                    Text('${price.toString().replaceAll(RegExp(r'\.0+'), '')}₽'),
                  ],
                ),

                button,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
