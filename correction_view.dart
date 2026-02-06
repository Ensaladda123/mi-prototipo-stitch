
import 'package:flutter/material.dart';
import 'models.dart';

class CorrectionView extends StatelessWidget {
  final Student student;
  const CorrectionView({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Corregir Respuesta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Respuesta del Alumno', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const Text('Enviado hoy a las 10:30 AM', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                Container(height: 120, width: double.infinity, color: Colors.blue.shade100, child: const Icon(Icons.image, color: Colors.blue)),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.auto_stories, color: Colors.emerald, size: 20),
                          SizedBox(width: 8),
                          Text('Lección: ¿Qué significa la fe?', style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(color: Colors.grey.shade50, borderRadius: BorderRadius.circular(16)),
                        child: const Text(
                          '"Para mí la fe es la certeza de lo que se espera y la convicción de lo que no se ve. Es confiar plenamente en el plan de Dios para mi vida cotidiana."',
                          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text('Acciones del Maestro', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _ActionBtn(
                  label: 'Aprobar',
                  icon: Icons.check_circle,
                  color: Colors.emerald,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _ActionBtn(
                  label: 'Rechazar',
                  icon: Icons.cancel,
                  color: Colors.red,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Text('COMENTARIO DEL MAESTRO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.5)),
          const SizedBox(height: 12),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Escribe una retroalimentación...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  const _ActionBtn({required this.label, required this.icon, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color.withOpacity(0.1),
        foregroundColor: color,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: BorderSide(color: color.withOpacity(0.2)),
      ),
      icon: Icon(icon),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
