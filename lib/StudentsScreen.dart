import 'package:flutter/material.dart';
import 'package:mips_mais/CadastraAlunoScreen.dart';
import 'package:mips_mais/DesempenhoScreen.dart';
import 'package:mips_mais/RankingProfessoresScreen.dart';
import 'package:mips_mais/DesempenhoAlunoScreen.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1121),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1121),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Meus alunos',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Barra de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C2333),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white54),
                  hintText: 'Pesquisar aluno',
                  hintStyle: TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // Container arredondado com cards
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: ListView(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CadastraAlunoScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      '+Adicionar Aluno',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B1121),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),
                  _cardTile(
                    icon: Icons.bar_chart,
                    iconColor: Colors.black,
                    background: const Color(0xFFE6F0FA),
                    title: 'Ranking de professores',
                    subtitle: 'Professores dando estudos',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RankingProfessoresScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  _cardTile(
                    icon: Icons.insights,
                    iconColor: Colors.red,
                    background: const Color(0xFFFDEEEF),
                    title: 'Meu desempenho',
                    subtitle: 'Meus estudos bíblicos',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const DesempenhoScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Alunos',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B1121),
                    ),
                  ),
                  const SizedBox(height: 15),
                  _studentTile(
                    context,
                    'Maren Workman',
                    '8/20 Lições',
                    Colors.pink[100]!,
                  ),
                  _studentTile(
                    context,
                    'Brandon Matrovs',
                    '10/20 Lições',
                    Colors.blue[100]!,
                  ),
                  _studentTile(
                    context,
                    'Manuela Lipshutz',
                    '18/20 Lições',
                    Colors.green[100]!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardTile({
    required IconData icon,
    required Color iconColor,
    required Color background,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0B1121),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget _studentTile(
    BuildContext context,
    String name,
    String progress,
    Color bgColor,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => DesempenhoAlunoScreen(
                  nome: 'Maren Workman',
                  progresso: '8/20 Lições',
                  avatarColor: Colors.pink[100]!,
                  aulasRealizadas: 8,
                  totalAulas: 20,
                  lessons: [
                    'A Bíblia Sagrada',
                    'A Beleza da Criação',
                    'A origem do Mal',
                    'O plano da Salvação',
                    'Fé Arrependimento',
                  ],
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: bgColor,
              radius: 24,
              child: const Icon(Icons.person, color: Colors.black),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B1121),
                  ),
                ),
                Text(
                  progress,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
