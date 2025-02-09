import 'package:flutter/material.dart';
import '../templates/atomic_login_template.dart';


class AtomicLoginPage extends StatelessWidget {
  const AtomicLoginPage({super.key});

  void _handleLogin(String email, String password) {
    // Aquí puedes implementar la autenticación con Firebase u otro backend
    print("Login con: Email: $email, Password: $password");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AtomicTemplateLogin(
        onLogin: _handleLogin,
      ),
    );
  }
}
