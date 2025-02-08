import 'package:flutter/material.dart';
import '../templates/atomic_login_template.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  void _handleLogin(String email, String password) {
    // Aquí puedes implementar la autenticación con Firebase u otro backend
    print("Login con: Email: $email, Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TemplateLogin(
        onLogin: _handleLogin,
      ),
    );
  }
}
