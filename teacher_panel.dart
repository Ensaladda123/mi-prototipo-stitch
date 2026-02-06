
import 'package:flutter/material.dart';
import 'models.dart';
import 'correction_view.dart';

class TeacherPanel extends StatelessWidget {
  const TeacherPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Student> students = [
      Student(id: 1, name: 'Juan Delgado', avatarUrl: 'https://i.pravatar.cc/150?u=1', currentModule: 'Módulo 2: Oración', pendingCorrection: true),
      Student(id: 2, name: 'María Castro', avatarUrl: 'https://i.pravatar.cc/150?u=2', currentModule: 'Módulo 1: Fundamentos', pendingCorrection: false),
      Student(id: 3, name: 'Roberto Sánchez', avatarUrl: 'https://i.pravatar.cc/150?u=3', currentModule: 'Módulo 3: Servicio', pendingCorrection: true),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Lista de Estudiantes', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('CAMINANDO CON CRISTO', style: TextStyle(fontSize: 10, color: Colors.emerald, letterSpacing: 1.2, fontWeight: FontWeight.bold)),
          ],
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: const [Padding(padding: EdgeInsets.only(right: 16.0), child: Icon(Icons.account_circle))],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SearchBar(
              hintText: 'Buscar estudiantes...',
              leading: const Icon(Icons.search),
              elevation: WidgetStateProperty.all(0),
              backgroundColor: WidgetStateProperty.all(Colors.grey.shade200),
              padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16)),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: students.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 80),
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  leading: CircleAvatar(radius: 28, backgroundImage: NetworkImage(student.avatarUrl)),
                  title: Text(student.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(student.currentModule, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (student.pendingCorrection) 
                        const CircleAvatar(radius: 12, backgroundColor: Colors.orange, child: Icon(Icons.notifications, size: 14, color: Colors.white)),
                      const SizedBox(width: 8),
                      const Icon(Icons.chevron_right, color: Colors.grey),
                    ],
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => CorrectionView(student: student))),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF0D59F2),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Estudiantes'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Sesiones'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }
}
