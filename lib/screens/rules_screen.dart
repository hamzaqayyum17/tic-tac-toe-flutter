import 'package:flutter/material.dart';

class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),

      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        title: const Text('How to Play'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Game Rules',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _ruleItem(
              number: '1',
              title: 'Choose a Game Mode',
              description:
                  'Select Single Player to play against the computer '
                  'or Two Players to play with a friend.',
            ),

            _ruleItem(
              number: '2',
              title: 'Take Your Turn',
              description:
                  'Player X starts the game. Players take turns placing '
                  'their symbol on an empty board cell.',
            ),

            _ruleItem(
              number: '3',
              title: 'Make a Line',
              description:
                  'The first player to make a line of three matching '
                  'symbols horizontally, vertically, or diagonally wins.',
            ),

            _ruleItem(
              number: '4',
              title: 'Draw Game',
              description:
                  'If all nine cells are filled and nobody makes a line, '
                  'the game ends in a draw.',
            ),

            _ruleItem(
              number: '5',
              title: 'Restart Game',
              description:
                  'Press Restart Game to clear the board and start '
                  'a new round.',
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Tip: Think carefully and try to block your opponent!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF60A5FA),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ruleItem({
    required String number,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF2563EB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}