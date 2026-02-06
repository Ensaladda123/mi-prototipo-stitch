
import 'package:flutter/material.dart';
import 'models.dart';
import 'chapter_view.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Book> books = [
      Book(id: 1, title: 'Fundamentos de Fe', subtitle: 'Módulo 1', progress: 0.65, locked: false, colorHex: '0xFF0D59F2'),
      Book(id: 2, title: 'Vida de Oración', subtitle: 'Módulo 2', progress: 0.0, locked: true, colorHex: '0xFF94A3B8'),
      Book(id: 3, title: 'El Carácter de Cristo', subtitle: 'Módulo 3', progress: 0.0, locked: true, colorHex: '0xFF94A3B8'),
      Book(id: 4, title: 'El Gran Mandato', subtitle: 'Módulo 4', progress: 0.0, locked: true, colorHex: '0xFF94A3B8'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Hola, Daniel!', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _DailyVerseCard(),
          const SizedBox(height: 32),
          const Text('Mis Libros', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...books.map((book) => _BookListItem(book: book)).toList(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF0D59F2),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Libros'),
          BottomNavigationBarItem(icon: Icon(Icons.groups), label: 'Comunidad'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}

class _DailyVerseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.auto_awesome, size: 16, color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 8),
                const Text('VERSÍCULO DEL DÍA', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              '"Lámpara es a mis pies tu palabra, y lumbrera a mi camino."',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text('Salmos 119:105', style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _BookListItem extends StatelessWidget {
  final Book book;
  const _BookListItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: book.locked ? 0.6 : 1.0,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          onTap: book.locked ? null : () => Navigator.push(context, MaterialPageRoute(builder: (c) => ChapterView(book: book))),
          borderRadius: BorderRadius.circular(24),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(int.parse(book.colorHex)),
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Center(child: Icon(book.locked ? Icons.lock : Icons.menu_book, color: Colors.white, size: 40)),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(book.subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: book.progress,
                      backgroundColor: Colors.grey.shade100,
                      color: const Color(0xFF0D59F2),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('PROGRESO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                        Text('${(book.progress * 100).toInt()}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0D59F2))),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
