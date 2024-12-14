import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            const Text(
              'Иван Иванов',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10), 
            const Text(
              '+7 (123) 456-78-90',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 10,),
            const Text(
              'example@mail.com',
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Column(
                children: [
                  _buildButton(Icons.list, 'Мои заказы'),
                  _buildButton(Icons.assignment, 'Медицинские карты'),
                  _buildButton(Icons.home, 'Мои адреса'),
                  _buildButton(Icons.settings, 'Настройки'),
                ],
              ),
            ),
            const SizedBox(height: 40),

            const Center(
              child: Column(
                children: [
                  Text('Ответы на вопросы', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  Text('Политика конфиденциальности', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10), 
                  Text('Пользовательское соглашение', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10), 
                  Text(
                    'Выход',
                    style: TextStyle(color: Colors.red), 
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 0.0), 
      leading: Icon(icon, size: 30), 
      title: Text(title),
      onTap: () {},
    );
  }
}
