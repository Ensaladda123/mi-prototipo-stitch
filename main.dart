
import 'package:flutter/material.dart';
import 'login_screen.dart';

void main() {
  runApp(const CaminandoConCristoApp());
}

class CaminandoConCristoApp extends StatelessWidget {
  const CaminandoConCristoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caminando con Cristo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D59F2),
          primary: const Color(0xFF0D59F2),
          secondary: const Color(0xFFD4AF37),
          surface: const Color(0xFFF5F6F8),
        ),
        fontFamily: 'Lexend', // Asegúrate de añadir la fuente en pubspec.yaml
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          color: Colors.white,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
