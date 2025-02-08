import 'package:flutter/material.dart';
import '../molecules/atomic_texfield_with_label.dart';
 // Importa la molécula creada

class DynamicForm extends StatefulWidget {
  final int fieldCount;
  final Function(Map<String, String>) onSubmit; // Callback para obtener los datos

  const DynamicForm({
    super.key,
    required this.fieldCount,
    required this.onSubmit,
  });

  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  final _formKey = GlobalKey<FormState>();
  late List<TextEditingController> _controllers;
  late List<String> _labels;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.fieldCount, (index) => TextEditingController());
    _labels = List.generate(widget.fieldCount, (index) => "Campo ${index + 1}");
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Map<String, String> formData = {};
      for (int i = 0; i < widget.fieldCount; i++) {
        formData[_labels[i]] = _controllers[i].text;
      }
      widget.onSubmit(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // 📝 Genera los campos dinámicamente
          for (int i = 0; i < widget.fieldCount; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AtomicTextFormFieldWithLabel(
                label: _labels[i],
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

          // 🔘 Botón de envío
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text("Enviar"),
          ),
        ],
      ),
    );
  }
}
