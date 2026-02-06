
import 'package:flutter/material.dart';
import 'models.dart';
import 'student_home.dart';
import 'teacher_panel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRole? _selectedRole;
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _handleLogin() {
    if (_selectedRole == UserRole.alumno) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StudentHome()),
      );
    } else {
      // Validación básica del código de maestro
      String code = _controllers.map((e) => e.text).join();
      if (code.length == 4) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TeacherPanel()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Por favor, ingresa el código de 4 dígitos proporcionado por tu congregación.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _onCodeChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              // Logo e Iconografía Espiritual
              Center(
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary.withOpacity(0.1),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.secondary.withOpacity(0.05),
                        blurRadius: 30,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.auto_awesome,
                    size: 70,
                    color: colorScheme.secondary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Título y Eslogan
              Text(
                'Caminando con',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: Colors.slate.shade600,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                'Cristo',
                textAlign: TextAlign.center,
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: colorScheme.primary,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.slate.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _selectedRole == UserRole.maestro 
                      ? 'ÁREA DE MAESTROS' 
                      : 'CRECIMIENTO ESPIRITUAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Colors.slate.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // Selección de Rol
              Row(
                children: [
                  Expanded(
                    child: _RoleButton(
                      title: 'Alumno',
                      subtitle: 'Recibir enseñanza',
                      icon: Icons.school_outlined,
                      selectedIcon: Icons.school,
                      isSelected: _selectedRole == UserRole.alumno,
                      onTap: () => setState(() => _selectedRole = UserRole.alumno),
                      activeColor: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _RoleButton(
                      title: 'Maestro',
                      subtitle: 'Guiar el camino',
                      icon: Icons.menu_book_outlined,
                      selectedIcon: Icons.menu_book,
                      isSelected: _selectedRole == UserRole.maestro,
                      onTap: () => setState(() => _selectedRole = UserRole.maestro),
                      activeColor: colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Entrada de PIN (Solo para Maestro)
              if (_selectedRole == UserRole.maestro)
                AnimatedScale(
                  scale: _selectedRole == UserRole.maestro ? 1.0 : 0.8,
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    children: [
                      const Text(
                        'INGRESA TU CÓDIGO MINISTERIAL',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.slate,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) => SizedBox(
                          width: 55,
                          child: TextField(
                            controller: _controllers[index],
                            focusNode: _focusNodes[index],
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 1,
                            onChanged: (v) => _onCodeChanged(v, index),
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              counterText: "",
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.grey.shade200),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: colorScheme.secondary, width: 2),
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 60),
              // Botón de Acción Principal
              FilledButton(
                onPressed: _selectedRole == null ? null : _handleLogin,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  backgroundColor: _selectedRole == UserRole.maestro 
                      ? colorScheme.secondary 
                      : colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                  shadowColor: (_selectedRole == UserRole.maestro 
                          ? colorScheme.secondary 
                          : colorScheme.primary)
                      .withOpacity(0.3),
                ),
                child: Text(
                  _selectedRole == UserRole.maestro ? 'Verificar y Entrar' : 'Comenzar Mi Trayecto',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),
              // Pie de página / Soporte
              Center(
                child: Text.rich(
                  TextSpan(
                    text: '¿Necesitas ayuda? ',
                    style: TextStyle(color: Colors.slate.shade400, fontSize: 13),
                    children: [
                      TextSpan(
                        text: 'Contactar Soporte',
                        style: TextStyle(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final IconData selectedIcon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color activeColor;

  const _RoleButton({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selectedIcon,
    required this.isSelected,
    required this.onTap,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(28),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.06) : Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isSelected ? activeColor : Colors.grey.shade200,
            width: 2,
          ),
          boxShadow: isSelected 
            ? [BoxShadow(color: activeColor.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))]
            : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? activeColor : Colors.slate.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isSelected ? selectedIcon : icon,
                color: isSelected ? Colors.white : Colors.slate.shade300,
                size: 30,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: isSelected ? activeColor : Colors.slate.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? activeColor.withOpacity(0.7) : Colors.slate.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
