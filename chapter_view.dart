
import 'package:flutter/material.dart';
import 'models.dart';

class ChapterView extends StatelessWidget {
  final Book book;
  const ChapterView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Lectura Devocional', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          Container(height: 6, width: 60, decoration: BoxDecoration(color: const Color(0xFF0D59F2), borderRadius: BorderRadius.circular(3))),
          const SizedBox(height: 32),
          const Text(
            'En este capítulo, exploramos los pilares de la fe y la importancia de caminar en integridad. La reflexión diaria nos permite conectar profundamente con los propósitos divinos.\n\nLa gracia es el fundamento sobre el cual construimos nuestra vida nueva, permitiendo que cada paso sea guiado por la luz de la verdad.',
            style: TextStyle(fontSize: 18, height: 1.6, color: Colors.black87),
          ),
          const SizedBox(height: 40),
          const Divider(),
          const SizedBox(height: 32),
          const Row(
            children: [
              Icon(Icons.edit_note, color: Color(0xFF0D59F2)),
              SizedBox(width: 8),
              Text('Preguntas de Reflexión', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 24),
          _ReflectionField(label: '1. ¿Qué resonó más en tu corazón hoy?'),
          const SizedBox(height: 24),
          _ReflectionField(label: '2. ¿Cómo aplicarás este pilar de fe?'),
          const SizedBox(height: 24),
          _ReflectionField(label: '3. Petición de oración:'),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: FilledButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.send),
              label: const Text('Enviar a Corregir', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _ReflectionField extends StatelessWidget {
  final String label;
  const _ReflectionField({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 12),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Escribe tu reflexión...',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
