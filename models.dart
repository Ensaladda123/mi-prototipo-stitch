
enum UserRole { alumno, maestro }

class Book {
  final int id;
  final String title;
  final String subtitle;
  final double progress;
  final bool locked;
  final String colorHex;

  Book({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.locked,
    required this.colorHex,
  });
}

class Student {
  final int id;
  final String name;
  final String avatarUrl;
  final String currentModule;
  final bool pendingCorrection;

  Student({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.currentModule,
    required this.pendingCorrection,
  });
}
