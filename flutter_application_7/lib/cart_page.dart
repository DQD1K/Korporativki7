import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> data; 

  const CartPage({super.key, required this.data}); 

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _increaseQuantity(int index) {
    setState(() {
      widget.data[index]['quantity']++;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (widget.data[index]['quantity'] > 1) {
        widget.data[index]['quantity']--;
      } else {
        _removeFromCart(index); 
      }
    });
  }

  void _removeFromCart(int index) {
    setState(() {
      widget.data[index]['isInCart'] = false; 
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;

 
    for (var item in widget.data) {
      if (item['isInCart']) {
        totalAmount += item['price'] * item['quantity'];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина', style: TextStyle(color: Colors.black)), 
        backgroundColor: Colors.white, 
        iconTheme: const IconThemeData(color: Colors.black), 
      ),
      body: Container(
        color: Colors.white, 
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context, index) {
            if (widget.data[index]['isInCart']) {
              double itemTotal = widget.data[index]['price'].toDouble() * widget.data[index]['quantity'];

              return Card(
                color: Colors.white,
                margin: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 120.0, 
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LayoutBuilder(
                              builder: (context, constraints) {
                                return Container(
                                  color: Colors.white,
                                  constraints: BoxConstraints(
                                    maxWidth: constraints.maxWidth * 0.9, 
                                  ),
                                  child: Text(
                                    widget.data[index]['title'],
                                    style: const TextStyle(fontSize: 15),
                                    softWrap: true, 
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 4.0),
                            Text('${widget.data[index]['price']}₽', style: const TextStyle(fontSize: 16)),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: Colors.black), 
                            onPressed: () => _removeFromCart(index),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Row(
                            children: [
                              Text('${widget.data[index]['quantity']} пациент', style: const TextStyle(fontSize: 12)),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _increaseQuantity(index),
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () => _decreaseQuantity(index),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox.shrink(); 
          },
        ),
      ),
bottomNavigationBar: Container(
  color: Colors.white, 
  padding: const EdgeInsets.all(16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    children: [
      const Text(
        'Сумма:',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      Text(
        '${totalAmount.toStringAsFixed(2)} ₽',
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  ),
),


    );
  }
}

