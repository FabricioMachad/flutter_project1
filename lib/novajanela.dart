import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  final String username;
  final String password;

  WelcomePage({required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 165, 6, 27),
        Color(0xFF429EF5)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
  );
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo'),
      ),
      body: Container(
          decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo, $username!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Sua senha é: $password',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    ),
    );
  }
}