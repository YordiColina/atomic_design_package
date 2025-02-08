import 'package:flutter/material.dart';
import '../organism/Atomic_form.dart';

class TemplateRegister extends StatelessWidget {
  final void Function(Map<String, String>) onRegister;

  const TemplateRegister({super.key, required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 📌 Título
              const Text(
                "Registro de Usuario",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // 📌 Formulario dinámico
              DynamicForm(
                fieldCount: 3, // Número de campos (Ejemplo: Nombre, Email, Contraseña)
                onSubmit: onRegister, // Se ejecuta al enviar el formulario
              ),
            ],
          ),
        ),
      ),
    );
  }
}
