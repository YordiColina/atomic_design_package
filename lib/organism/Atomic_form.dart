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

  /// Indica si el campo de texto es de tipo contraseña.
  final bool? obscureText;

  /// Callback que devuelve una lista de String con los valores indicando si los campos están llenos.
  final Function(List<String>) onFieldsFilled;

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
    this.fontWeight, this.obscureText,
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
    List<String> controllersValues = [];
    if (allFieldsFilled) {
      setState(() {
        for(int i = 0; i < _controllers.length; i++) {
          controllersValues.add(_controllers[i].text);
        }
      });
    }
    widget.onFieldsFilled(controllersValues);
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
                  obscureText: (widget.labels[i] == "password" || widget.labels[i] == "contraseña") &&
                  widget.obscureText != false  ? true : false,
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