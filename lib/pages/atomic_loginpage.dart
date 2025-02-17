/**
 * Página de inicio de sesión.
 *
 * Este widget muestra la pantalla de inicio de sesión utilizando el componente `AtomicTemplateLogin`.
 * Se encarga de recibir las credenciales ingresadas por el usuario y pasarlas a la función `onLogin`.
 */

import 'package:flutter/material.dart';
import '../atoms/atomic_text.dart';
import '../templates/atomic_login_template.dart';

/// Página de inicio de sesión.
///
/// Este widget encapsula la plantilla de inicio de sesión [`AtomicTemplateLogin`]
/// dentro de un `Scaffold` para estructurar la pantalla.
///
/// ### Parámetros:
/// - [onLogin]: Función que se ejecuta cuando el usuario ingresa sus credenciales correctamente.
class AtomicLoginPage extends StatelessWidget {

  /// Función que se ejecutará cuando se presione el botón.
  final VoidCallback onPressed;

  /// Callback que devuelve un booleano indicando si los campos están llenos.
  final Function(bool) onFieldsFilled;

  ///función para manejar la navegación de retorno
  final void Function() onBack;

  /// Icono que se muestra en la parte superior de la pantalla.
  final IconData icon;

  /// Título que se muestra en la parte superior del formulario
  final String title;

  /// tamaño del texto del titulo
  final TextSize? titleSize;

  /// color del titulo
  final Color? titleColor;

  /// Título que se muestra en la parte superior del formulario.
  ///  Ejemplo: "Iniciar sesión"
  final String subTitle;

  /// tamaño del texto del subtitulo
  final TextSize? subtitleSize;

  /// Etiquetas de los campos de texto.
  ///   Ejemplo: "Correo electrónico"
  ///
  final Color? subTitleColor;

  final List<String> labels;

  /// Texto del botón de inicio de sesión.
  final String buttonText;

  /// Color del botón.
  final Color? buttonColor;

  /// Color del texto del botón.
  final Color? buttonTextColor;

  /// Número de campos de texto.
  final int fieldsNumber;

  /// El peso de la fuente del texto.
  final FontWeight fontWeight;

  /// El color del texto del label.
  final Color? textColorLabel;

  /// El tamaño del texto, que afecta su estilo.
  /// Por defecto, usa [TextSize.medium].
  final TextSize? sizeOfLabelText;

  /// El peso de la fuente del texto.
  final FontWeight? fontWeightOfLabelText;

  /// color del ícono
  final Color? iconColor;

  /// tamaño del ícono
  final double iconSize;

  /// Constructor de [AtomicLoginPage].
  ///
  /// - [onLogin] es obligatorio y maneja la lógica de autenticación.
  const AtomicLoginPage(
      {super.key,
      required this.icon,
      required this.title,
      required this.labels,
      required this.buttonText,
      this.buttonColor,
      this.buttonTextColor,
      this.titleColor,
      required this.fieldsNumber,
      this.textColorLabel,
      this.sizeOfLabelText,
      this.fontWeightOfLabelText,
      required this.subTitle,
      this.subTitleColor,
      this.iconColor,
      this.titleSize,
      this.subtitleSize, required this.iconSize, required this.fontWeight, required this.onBack, required this.onPressed, required this.onFieldsFilled});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: GestureDetector(
          onTap: onBack ,
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AtomicText(
                        text: title,
                        fontWeight: FontWeight.bold,
                        size: TextSize.large,
                        textAlign: TextAlign.center,
                        color: titleColor ?? Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            AtomicTemplateLogin(
              icon: icon,
              iconSize: iconSize,
              iconColor: iconColor,
              title: subTitle,
              labels: labels,
              buttonText: buttonText,
              buttonColor: buttonColor,
              buttonTextColor: buttonTextColor,
              titleColor: subTitleColor,
              fieldsNumber: fieldsNumber,
            fontWeightSubtitle: fontWeight,
            onPressed: onPressed,
            onFieldsFilled: (bool ) {
                onFieldsFilled.call(bool);
            },
            ),
          ],
        ),
      ),
    );
  }
}
