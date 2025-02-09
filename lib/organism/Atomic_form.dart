import 'package:atomic_design/atoms/Atomic_button.dart';
import 'package:flutter/material.dart';
import '../molecules/atomic_texfield_with_label.dart';
 // Importa la molécula creada

class AtomicForm extends StatefulWidget {
  final int fieldCount;
  final String buttonText;
  final List<String> labels;
  final Function(Map<String, String>) onSubmit; // Callback para obtener los datos

  const AtomicForm({
    super.key,
    required this.fieldCount,
    required this.onSubmit,
    required this.buttonText, required this.labels,
  });

  @override
  _AtomicFormState createState() => _AtomicFormState();
}

class _AtomicFormState extends State<AtomicForm> {
  final _formKey = GlobalKey<FormState>();
  late List<TextEditingController> _controllers;


  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.fieldCount, (index) => TextEditingController());
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
        formData[widget.labels[i]] = _controllers[i].text;
      }
      widget.onSubmit(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // 📝 Genera los campos dinámicamente
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

            // 🔘 Botón de envío
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
