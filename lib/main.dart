import 'package:flutter/material.dart';

import 'novajanela.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  Pagina1 createState() => Pagina1();
    
}

class Pagina1 extends State<LoginPage> {
  final TextEditingController nome = TextEditingController();
  final TextEditingController senha = TextEditingController();
  bool _passwordVisible = false;

  void _login(BuildContext context) {
    String name = nome.text;
    String password = senha.text;

    if (name.isEmpty || password.isEmpty) {
      _showSnackBar(context, "Por favor, preencha todos os campos.");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomePage(username: name, password: password),
        ),
      );
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final gradient = LinearGradient(
      colors: [
        Color.fromARGB(255, 53, 147, 235),
        Color.fromARGB(255, 3, 80, 153)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
  );
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
          decoration: BoxDecoration(
          gradient: gradient,
        ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'), // Imagem do avatar
            ),
            SizedBox(height: 20),
            TextField(
              controller: nome,
              decoration: InputDecoration(
                labelText: 'Nome de usuário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: senha,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    ),
  );
  }
}
