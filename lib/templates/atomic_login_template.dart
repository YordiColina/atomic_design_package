/**
 * Plantilla de inicio de sesión con formulario y encabezado.
 *
 * Este componente muestra un formulario de inicio de sesión con campos de entrada para
 * el correo y la contraseña, además de un ícono y título en la parte superior.
 * Es adaptable a diferentes tamaños de pantalla.
 */



import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../molecules/atomic_icon_with_text.dart';
import '../organism/Atomic_form.dart';

/// Widget de plantilla para el inicio de sesión.
///
/// Contiene un formulario con los campos necesarios y un botón de envío.
/// Permite manejar la autenticación a través de un callback.
class AtomicTemplateLogin extends StatefulWidget {

  /// Función que se ejecutará cuando se presione el botón.
  final VoidCallback onPressed;

  /// Callback que devuelve una lista de String con los valores indicando si los campos están llenos.
  final Function(List<String>) onFieldsFilled;

  /// Ícono que se muestra en la parte superior de la plantilla.
  final IconData icon;

  /// Título que se muestra en la parte superior de la plantilla.
  final String title;

  /// Etiquetas de los campos del formulario.
  final List<String> labels;

  /// Texto del botón de envío del formulario.
  final String buttonText;

  /// Color del ícono.
  final Color? iconColor;

  /// tamaño del icono
  final double iconSize;

  /// tamaño del del titulo
  final TextSize? titleSize;

  /// Color del texto.
  final Color? titleColor;

  /// Color del botón.
  final Color? buttonColor;

  /// Color del texto del botón.
  final Color? buttonTextColor;

  /// El peso de la fuente del texto.
  final FontWeight fontWeightSubtitle;

  /// Número de campos en el formulario.
  final int fieldsNumber;

  /// El color del texto del label.
  final Color? textLabelColor;

  /// El tamaño del texto, que afecta su estilo.
  /// Por defecto, usa [TextSize.medium].
  final TextSize? sizeOfLabelText;

  /// El peso de la fuente del texto.
  final FontWeight? fontWeightLabelText;

  /// Constructor de [AtomicTemplateLogin].
  const AtomicTemplateLogin(
      {super.key,
      required this.icon,
      required this.title,
      required this.labels,
      required this.buttonText,
      this.titleColor,
      this.iconColor,
      this.buttonColor,
      this.buttonTextColor,
      required this.fieldsNumber,
      this.textLabelColor,
      this.sizeOfLabelText,
      this.fontWeightLabelText,
      this.titleSize, required this.iconSize, required this.fontWeightSubtitle, required this.onPressed, required this.onFieldsFilled});

  @override
  _AtomicTemplateLoginState createState() => _AtomicTemplateLoginState();
}

class _AtomicTemplateLoginState extends State<AtomicTemplateLogin> {
  /// Clave global para la validación del formulario.
  final _formKey = GlobalKey<FormState>();

  /// Controlador para el campo de correo electrónico.
  final TextEditingController _emailController = TextEditingController();

  /// Controlador para el campo de contraseña.
  final TextEditingController _passwordController = TextEditingController();

  /// Envía el formulario si la validación es correcta.
  ///
  /// Verifica que los campos no estén vacíos y ejecuta la función `onLogin`
  /// proporcionada en el widget padre.


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600; // Responsive para tablets

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isWideScreen ? 80 : 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 📌 Ícono con título centrado
            AtomicIconText(
              size: widget.iconSize,
              fontWeight: widget.fontWeightSubtitle,
              text: widget.title,
              icon: widget.icon,
              iconColor: widget.iconColor ?? Colors.blueAccent,
              textColor: widget.titleColor ?? Colors.black,
            ),
            const SizedBox(height: 24),

            // 📌 Formulario de inicio de sesión
            AtomicForm(
              key: _formKey,
              fieldCount: widget.fieldsNumber,
              buttonText: widget.buttonText,
              labels: widget.labels,
              buttonColor: widget.buttonColor,
              buttonTextColor: widget.buttonTextColor,
              onPressed: widget.onPressed,
              onFieldsFilled: (values) {
                widget.onFieldsFilled.call(values);
              },
            ),
          ],
        ),
      ),
    );
  }
}
