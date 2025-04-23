import 'package:flutter/material.dart';

class RankingProfessoresScreen extends StatelessWidget {
  const RankingProfessoresScreen({super.key});

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
          'Ranking de professores',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // Filtro de tempo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1C2333),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  _filterButton('Esta semana', false),
                  _filterButton('Todo tempo', true),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Pódio
          _buildPodium(),
          const SizedBox(height: 30),

          // Container arredondado com lista
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: const [
                  _RankingItem(
                    position: 4,
                    name: 'Madelyn Dias',
                    points: 590,
                    emoji: '🇭🇺',
                  ),
                  _RankingItem(
                    position: 5,
                    name: 'Zain Vaccaro',
                    points: 448,
                    emoji: '🇮🇹',
                  ),
                  _RankingItem(
                    position: 6,
                    name: 'Skylar Geidt',
                    points: 448,
                    emoji: '🇭🇺',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterButton(String label, bool selected) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF9F8BFF) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : Colors.white60,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPodium() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _podiumMember(
          name: 'Ruben Geidt',
          points: '1,469 QP',
          position: 2,
          avatarColor: Colors.pink[100]!,
        ),
        _podiumMember(
          name: 'Adison Press',
          points: '2,569 QP',
          position: 1,
          avatarColor: Colors.purple[100]!,
          crown: true,
        ),
        _podiumMember(
          name: 'Jakob Levin',
          points: '1,053 QP',
          position: 3,
          avatarColor: Colors.blue[100]!,
        ),
      ],
    );
  }

  Widget _podiumMember({
    required String name,
    required String points,
    required int position,
    required Color avatarColor,
    bool crown = false,
  }) {
    double height = position == 1 ? 130 : (position == 2 ? 100 : 90);

    return Expanded(
      child: Column(
        children: [
          if (crown)
            const Icon(Icons.emoji_events, color: Colors.amber, size: 24),
          CircleAvatar(
            backgroundColor: avatarColor,
            radius: 26,
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              points,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: height,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.deepPurple[300],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '$position',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RankingItem extends StatelessWidget {
  final int position;
  final String name;
  final int points;
  final String emoji;

  const _RankingItem({
    required this.position,
    required this.name,
    required this.points,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            '$position',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(width: 16),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.purple[100],
            child: const Icon(Icons.person, color: Colors.black),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Text(emoji, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 10),
          Text(
            '$points points',
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
