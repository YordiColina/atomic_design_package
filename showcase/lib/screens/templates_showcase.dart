import 'package:atomic_design/atoms/atomic_text.dart';
import 'package:atomic_design/templates/atomic_card_list_template.dart';
import 'package:atomic_design/templates/atomic_login_template.dart';
import 'package:atomic_design/templates/atomic_register_template.dart';
import 'package:flutter/material.dart';


class TemplatesShowcase extends StatelessWidget {

  const TemplatesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    void onLogin(String user, String password) {
      print(user);
    }
    final List<Map<String, dynamic>> items = [
      {
        "titulo": "Producto 1",
        "precio": 25000.5,
        "imageUrl": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
        "categoria": "Categoría A",
      },
      {
        "titulo": "Producto 2",
        "precio": 35000.5,
        "imageUrl": "https://www.billin.net/blog/wp-content/uploads/2021/06/Im%C3%A1genes-sin-derechos-de-autor.jpeg",
        "categoria": "Categoría B",
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const AtomicText(text: "Plantillas",size:  TextSize.large,
        fontWeight: FontWeight.bold, textAlign: TextAlign.center,)
      ),
      body: ListView(
        children: [
          Column(
            children: [
              AtomicTemplateCardList(
                title: "Ejemplo de Plantilla de lista de cards",
                items: items,
              ),

              const SizedBox(height: 20,),
              const Divider(thickness: 2, color: Colors.black,),

              const AtomicText( text: "Ejemplo de Plantilla de Login",size:  TextSize.medium,
                fontWeight: FontWeight.bold, textAlign: TextAlign.center,),

              AtomicTemplateLogin(onLogin: onLogin),

              const SizedBox(height: 20,),
              const Divider(thickness: 2, color: Colors.black,),

              const AtomicText(text:"Ejemplo de Plantilla de registro", size:  TextSize.medium,
                fontWeight: FontWeight.bold, textAlign: TextAlign.center,),

             AtomicTemplateRegister(
               onRegister: (Map<String, String> data) {
                 print(data);
               },
               labels: ["Nombre", "Email", "Contraseña"],
               buttonText: "Registrar",
             ),

            ],
          ),
        ],
      ),
    );


  }
}
