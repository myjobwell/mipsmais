import 'package:flutter/material.dart';

class DesempenhoAlunoScreen extends StatelessWidget {
  final String nome;
  final String progresso; // Exemplo: "8/20 Lições"
  final Color avatarColor;
  final int aulasRealizadas; // Exemplo: 8
  final int totalAulas; // Exemplo: 20
  final List<String> lessons; // Lista de aulas ministradas

  const DesempenhoAlunoScreen({
    super.key,
    required this.nome,
    required this.progresso,
    required this.avatarColor,
    required this.aulasRealizadas,
    required this.totalAulas,
    required this.lessons,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1121),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B1121),
        elevation: 0,
        title: const Text(
          'Desempenho do Aluno',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 10),
          _buildEstudoInfo(),
          const SizedBox(height: 20),
          _buildProgressoCard(),
          const SizedBox(height: 30),
          _buildAlunoInfo(),
          const SizedBox(height: 20),
          const Text(
            'Aulas Ministradas',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          _buildLessonsList(),
        ],
      ),
    );
  }

  Widget _buildEstudoInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Estudo',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 4),
            Text(
              'Ouvindo a Voz de Deus',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1F2A3F),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.extension, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildProgressoCard() {
    final double percent = totalAulas > 0 ? aulasRealizadas / totalAulas : 0.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFFF8FAE),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: percent,
                  strokeWidth: 6,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Colors.white30,
                ),
              ),
              Text(
                '$aulasRealizadas/$totalAulas',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Você realizou\n$aulasRealizadas de $totalAulas Aulas',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlunoInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2333),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: avatarColor,
            radius: 24,
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                progresso,
                style: const TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLessonsList() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEF9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: List.generate(lessons.length, (index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(
                  lessons[index],
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(
                  Icons.workspace_premium,
                  color: Colors.green,
                ),
              ),
              if (index != lessons.length - 1)
                const Divider(height: 1, color: Colors.white70),
            ],
          );
        }),
      ),
    );
  }
}
