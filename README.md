# Atomic Design for Flutter

![Atomic Design](https://miro.medium.com/max/1400/1*9z7wT9-o7y6v4ebMrzAWzQ.png)

Este paquete proporciona una arquitectura basada en **Atomic Design** para la creación de interfaces modulares y escalables en Flutter. Organiza los componentes de la UI en **átomos, moléculas, organismos, plantillas y páginas**, facilitando la reutilización y mantenimiento del código.

## 🚀 Características

- **Estructura modular** basada en Atomic Design.
- **Componentes reutilizables** para una interfaz consistente.
- **Fácil integración** en proyectos Flutter existentes.
- **Showcase interactivo** para visualizar cada componente en acción.

## 📦 Instalación

Agrega el paquete en tu archivo `pubspec.yaml`:

```yaml
dependencies:
  atomic_design:
    git:
      url: https://github.com/YordiColina/atomic_design_package.git
```

Luego, ejecuta:

```sh
flutter pub get
```

## 🏗️ Estructura del Paquete

```
lib/
│── atoms/            # Componentes básicos (botones, textos, etc.)
│── molecules/        # Combinaciones simples de átomos (iconos con label, etc.)
│── organisms/        # Componentes más complejos (tarjetas, formularios, etc.)
│── templates/        # Estructuras de pantalla (Login, Dashboard, etc.)
│── pages/            # Páginas completas con diseño basado en plantillas
         
```

## 🎨 Uso

Importa los componentes necesarios en tu proyecto:

```dart
import 'package:atomic_design_package/atoms/button.dart';
import 'package:atomic_design_package/molecules/text_field_with_label.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              AtomicButton(label: "Presionar", onPressed: (_onPresed) {}),
              TextFieldWithLabel(label: "Nombre", hintText: "Ingrese su nombre"),
            ],
          ),
        ),
      ),
    );
  }
}
```

## 🛠 Showcase Interactivo

Para visualizar los componentes en acción, ejecuta la aplicación de ejemplo:

```sh
cd example
flutter run
```

Esto abrirá un **Showcase UI** con ejemplos de cada nivel del sistema de diseño.

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Si deseas colaborar:

1. Haz un fork del repositorio.
2. Crea una rama (`feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz un commit (`git commit -m 'Agrega nueva funcionalidad'`).
4. Envía un pull request.

## 📝 Información Adicional

- [Guía sobre Atomic Design](https://bradfrost.com/blog/post/atomic-web-design/)
- [Documentación de Flutter](https://flutter.dev/docs)

Para cualquier consulta o reporte de errores, abre un issue en el repositorio del proyecto.

📌 **Mantén tu UI escalable y organizada con Atomic Design!**

