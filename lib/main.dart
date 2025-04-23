import 'package:flutter/material.dart';
import 'package:mips_mais/StudentsScreen.dart';
import 'package:mips_mais/criar_conta_screen.dart'; // ajuste o caminho se necessário

void main() {
  runApp(const MipsApp());
}

class MipsApp extends StatelessWidget {
  const MipsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIPS+',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1121),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(top: 80, left: 30, child: _circle(60, Colors.white12)),
            Positioned(top: 140, right: 50, child: _circle(16, Colors.white10)),
            Positioned(
              top: 250,
              left: 180,
              child: _circle(12, Colors.purpleAccent),
            ),
            Positioned(
              bottom: -40,
              left: -40,
              child: _circle(180, Colors.white12),
            ),
            Positioned(
              bottom: 60,
              right: -20,
              child: _circle(80, Colors.white10),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'MIPS+',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF43B74F),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ministério de Pessoal +',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 80),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0B1121),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Entre ou crie uma conta para os\ndesafios missionários',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        const SizedBox(height: 30),

                        // Botão de Login com redirecionamento
                        HoverButtonWidget(
                          label: 'Login',
                          backgroundColor: const Color(0xFF0B1121),
                          hoverColor: const Color(0xFF1F2A3F),
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const StudentsScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 15),

                        // Botão Criar Conta (ainda sem ação)
                        HoverButtonWidget(
                          label: 'Criar uma conta',
                          backgroundColor: const Color(0xFFE6E6E6),
                          hoverColor: const Color(0xFFD0D0D0),
                          textColor: const Color(0xFF0B1121),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const CriarContaScreen(),
                              ),
                            );

                            // ação criar conta (futuro)
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class HoverButtonWidget extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color hoverColor;
  final Color textColor;

  const HoverButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    required this.backgroundColor,
    required this.hoverColor,
    required this.textColor,
  });

  @override
  State<HoverButtonWidget> createState() => _HoverButtonWidgetState();
}

class _HoverButtonWidgetState extends State<HoverButtonWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: isHovered ? widget.hoverColor : widget.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 16,
                color: widget.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setHover(bool hovered) {
    setState(() {
      isHovered = hovered;
    });
  }
}
