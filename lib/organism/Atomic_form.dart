/**
 * Un formulario dinámico basado en Atomic Design.
 *
 * Este widget permite generar un formulario con un número variable de campos de entrada
 * y un botón de envío. Los datos ingresados se envían a través de un callback.
 */

import 'package:atomic_design/atoms/Atomic_button.dart';
import 'package:flutter/material.dart';
import '../molecules/atomic_textfield_with_label.dart';

/// Un formulario dinámico que permite capturar datos de múltiples campos.
class AtomicForm extends StatefulWidget {
  /// Número de campos de entrada que tendrá el formulario.
  final int fieldCount;

  /// Texto del botón de envío.
  final String buttonText;

  /// Etiquetas asociadas a cada campo de entrada.
  final List<String> labels;

  /// Función de callback que se ejecuta al enviar el formulario.
  ///
  /// Retorna un `Map<String, String>` con las etiquetas como claves y los valores ingresados como datos.
  final Function(Map<String, String>) onSubmit;

  /// Crea una instancia de [AtomicForm].
  const AtomicForm({
    super.key,
    required this.fieldCount,
    required this.onSubmit,
    required this.buttonText,
    required this.labels,
  });

  @override
  _AtomicFormState createState() => _AtomicFormState();
}

class _AtomicFormState extends State<AtomicForm> {
  /// Clave global para manejar la validación del formulario.
  final _formKey = GlobalKey<FormState>();

  /// Lista de controladores para los campos de entrada.
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    // Inicializa los controladores de texto según la cantidad de campos.
    _controllers = List.generate(widget.fieldCount, (index) => TextEditingController());
  }

  @override
  void dispose() {
    // Libera los controladores para evitar fugas de memoria.
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  /// Valida y envía los datos del formulario al callback.
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, String> formData = {};
      for (int i = 0; i < widget.fieldCount; i++) {
        formData[widget.labels[i]] = _controllers[i].text;
      }
      widget.onSubmit(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // 📝 Generación dinámica de los campos de entrada
            for (int i = 0; i < widget.fieldCount; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AtomicTextFormFieldWithLabel(
                  label: widget.labels[i],
                  controller: _controllers[i],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo es obligatorio';
                    }
                    return null;
                  },
                ),
              ),

            const SizedBox(height: 16),

            // 🔘 Botón para enviar el formulario
            AtomicButton(
              onPressed: _submitForm,
              label: widget.buttonText,
            ),
          ],
        ),
      ),
    );
  }
}
