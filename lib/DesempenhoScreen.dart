import 'package:flutter/material.dart';

class DesempenhoScreen extends StatelessWidget {
  const DesempenhoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Meu desempenho',
          style: TextStyle(
            color: Color(0xFF0B1121),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFF8FAE),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                const Icon(Icons.emoji_events, size: 60, color: Colors.yellow),
                const SizedBox(height: 10),
                const Text(
                  'Parabéns!',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const Text(
                  'Maren',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    '100 pts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'DESEMPENHO AO LONGO DO TEMPO',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _mockLineChart(),
          const SizedBox(height: 30),
          _statRow(),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0B1121),
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      // ação de compartilhamento
                    },
                    icon: const Icon(Icons.share, color: Colors.white),
                    label: const Text(
                      'Compartilhar desempenho',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mockLineChart() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: CustomPaint(painter: _LineChartPainter()),
    );
  }

  Widget _statRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 20,
        spacing: 40,
        children: const [
          _StatItem(title: 'AULAS MINISTRADAS', value: '28 aulas'),
          _StatItem(title: 'PESSOAS ESTUDANDO', value: '3'),
          _StatItem(title: 'VISITAS', value: '25'),
          _StatItem(title: '% CONCLUSÃO', value: '70%'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2 - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0B1121),
            ),
          ),
        ],
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFF0B1121)
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    final path = Path();
    final dataPoints = [
      20.0,
      40.0,
      35.0,
      60.0,
      50.0,
      30.0,
      70.0,
      60.0,
      50.0,
      40.0,
    ];

    double spacing = size.width / (dataPoints.length - 1);

    path.moveTo(0, size.height - dataPoints[0]);
    for (int i = 1; i < dataPoints.length; i++) {
      path.lineTo(i * spacing, size.height - dataPoints[i]);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
