import 'package:flutter/material.dart';
import '../molecules/atomic_icon_with_text.dart';
import '../organism/Atomic_form.dart';


class AtomicTemplateLogin extends StatefulWidget {
  final void Function(String email, String password) onLogin;

  const AtomicTemplateLogin({super.key, required this.onLogin});

  @override
  _AtomicTemplateLoginState createState() => _AtomicTemplateLoginState();
}

class _AtomicTemplateLoginState extends State<AtomicTemplateLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      if (email.isNotEmpty && password.isNotEmpty) {
        widget.onLogin(email, password);
      } else {
        print("Error: correo o contraseña vacíos");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return
     Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isWideScreen ? 80 : 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 📌 Ícono y título centrado
              const AtomicIconText(
                size: IconTextSize.medium,
                text: "Bienvenido",
                icon: Icons.lock,
                iconColor: Colors.blueAccent,
                textColor: Colors.black,
              ),
              const SizedBox(height: 24),

              // 📌 Formulario
              AtomicForm(
                key: _formKey,
                fieldCount: 3,
                onSubmit: (values ) {  },
                buttonText: 'Iniciar sesión',
                labels: const ['Nombre', 'Contraseña', 'Correo'],
              ),
            ],
          ),
        ),
      );

  }
}
