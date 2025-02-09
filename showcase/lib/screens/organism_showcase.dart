import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:atomic_design/organism/Atomic_form.dart';
import 'package:atomic_design/organism/atomic_card.dart';
import 'package:atomic_design/organism/atomic_detail_card.dart';
import 'package:flutter/material.dart';


class OrganismsShowcase extends StatelessWidget {
  const OrganismsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Organismos")),
      body: ListView(
        children: [
          Column(
            children: [
              const AtomicCard(
                titulo: "Ejemplo de Card",
                precio: 9.99,
                imageUrl: "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
                categoria: "Demo",
              ),
              const SizedBox(
                height: 16,
              ),
              const AtomicDetailCard(
                  titulo: "Ejemplo detail card",
                  precio: 8.35,
                  imageUrl: "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
                  categoria: "tech",
                  descripcion: "celular bonito, de ultima generación con 5G y 8GB de RAM"),

              const SizedBox(
                height: 16,
              ),

              const AtomicText(text:"Ejemplo de formulario", size:  TextSize.medium,
                fontWeight: FontWeight.bold, textAlign: TextAlign.center,),

              AtomicForm(fieldCount: 5, buttonText: "Crear cuenta", onSubmit: (values) {
                print(values);
              }, labels: ["nombre","apellido","edad","correo","dirección"],),
            ],
          ),
        ],
      ),
    );
  }
}
