import 'package:flutter/material.dart';
import 'atoms_showcase.dart';
import 'molecules_showcase.dart';
import 'organism_showcase.dart';
import 'templates_showcase.dart';
import 'pages_showcase.dart';

class ShowcaseHome extends StatelessWidget {
  const ShowcaseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Design System Showcase")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ShowcaseButton(title: "Átomos", page: AtomsShowcase()),
          const ShowcaseButton(title: "Moléculas", page: MoleculesShowcase()),
          const ShowcaseButton(title: "Organismos", page: OrganismsShowcase()),
          const ShowcaseButton(title: "Plantillas", page: TemplatesShowcase()),
          ShowcaseButton(title: "Páginas", page: PagesShowcase()),
          ShowcaseButton(title: "Mas páginas", page: PagesShowcase()),
        ],
      ),
    );
  }
}

class ShowcaseButton extends StatelessWidget {
  final String title;
  final Widget page;

  const ShowcaseButton({super.key, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        child: Text(title, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
