import 'package:flutter/material.dart';
import '../molecules/atomic_icon_with_text.dart';
import '../molecules/atomic_texfield_with_label.dart';


class TemplateLogin extends StatefulWidget {
  final void Function(String email, String password) onLogin;

  const TemplateLogin({super.key, required this.onLogin});

  @override
  _TemplateLoginState createState() => _TemplateLoginState();
}

class _TemplateLoginState extends State<TemplateLogin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onLogin(_emailController.text, _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      body: Center(
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
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 24),

              // 📌 Formulario
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AtomicTextFormFieldWithLabel(
                      label: "Correo electrónico",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese su correo";
                        }
                        if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
                          return "Correo inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    AtomicTextFormFieldWithLabel(
                      label: "Contraseña",
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ingrese su contraseña";
                        }
                        if (value.length < 6) {
                          return "Debe tener al menos 6 caracteres";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),

                    // 📌 Botón de inicio de sesión
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Iniciar sesión",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
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
}
