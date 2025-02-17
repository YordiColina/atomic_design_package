import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../molecules/atomic_textfield_with_label.dart';
import 'package:atomic_design/atoms/Atomic_button.dart';

/// Un formulario dinámico que permite capturar datos de múltiples campos.
class AtomicForm extends StatefulWidget {
  /// Número de campos de entrada que tendrá el formulario.
  final int fieldCount;

  /// Texto del botón de envío.
  final String buttonText;

  /// Etiquetas asociadas a cada campo de entrada.
  final List<String> labels;

  /// Color del botón.
  final Color? buttonColor;

  /// Color del texto del botón.
  final Color? buttonTextColor;

  /// El color del texto del label.
  final Color? textColor;

  /// El tamaño del texto, que afecta su estilo.
  /// Por defecto, usa [TextSize.medium].
  final TextSize? size;

  /// El peso de la fuente del texto.
  final FontWeight? fontWeight;

  /// Función que se ejecutará cuando se presione el botón.
  final VoidCallback onPressed;

  /// Callback que devuelve un booleano indicando si los campos están llenos.
  final Function(bool) onFieldsFilled;

  /// Crea una instancia de [AtomicForm].
  const AtomicForm({
    super.key,
    required this.fieldCount,
    required this.buttonText,
    required this.labels,
    required this.onPressed,
    required this.onFieldsFilled,
    this.buttonColor,
    this.buttonTextColor,
    this.textColor,
    this.size,
    this.fontWeight,
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

    // Agrega listeners a los controladores para verificar el estado de los campos.
    for (var controller in _controllers) {
      controller.addListener(_checkFields);
    }
  }

  @override
  void dispose() {
    // Libera los controladores para evitar fugas de memoria.
    for (var controller in _controllers) {
      controller.removeListener(_checkFields);
      controller.dispose();
    }
    super.dispose();
  }

  /// Verifica si todos los campos están llenos y llama al callback.
  void _checkFields() {
    bool allFieldsFilled = _controllers.every((controller) => controller.text.isNotEmpty);
    widget.onFieldsFilled(allFieldsFilled);
  }

  /// Valida el formulario y ejecuta la función onPressed si es válido.
  void _handleButtonPress() {
    if (_formKey.currentState!.validate()) {
      widget.onPressed();
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
              onPressed: _handleButtonPress,
              label: widget.buttonText,
              color: widget.buttonColor,
              textColor: widget.buttonTextColor,
            ),
          ],
        ),
      ),
    );
  }
}