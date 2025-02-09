import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../organism/Atomic_form.dart';

class AtomicTemplateRegister extends StatelessWidget {
  final void Function(Map<String, String>) onRegister;
  final List<String> labels;
  final String buttonText;

  const AtomicTemplateRegister({super.key, required this.onRegister, required this.labels, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 📌 Título
              const AtomicText(
               text:  "Registro de Usuario",
                size: TextSize.medium,
                fontWeight: FontWeight.bold, textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // 📌 Formulario dinámico
              AtomicForm(
                fieldCount: 3, // Número de campos (Ejemplo: Nombre, Email, Contraseña)
                onSubmit: onRegister,// Se ejecuta al enviar el formulario
                labels: labels, buttonText: buttonText,
              ),
            ],
          ),
        ),
      );

  }
}
