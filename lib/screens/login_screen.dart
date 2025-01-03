import 'package:flutter/material.dart';
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  User? currentUser;

  void _login() {
    // Contoh login dummy (username/password apa saja dianggap valid).
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      setState(() {
        currentUser = User(
          username: _usernameController.text,
          password: _passwordController.text,
          isLoggedIn: true,
        );
      });
      Navigator.pushReplacementNamed(context, '/home', arguments: currentUser);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username/Password tidak boleh kosong')),
      );
    }
  }

  void _goToRegister() {
    // Contoh navigasi ke page register
    Navigator.pushNamed(context, '/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Aplikasi Resep'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: _goToRegister,
              child: const Text('Belum punya akun? Register'),
            )
          ],
        ),
      ),
    );
  }
}
