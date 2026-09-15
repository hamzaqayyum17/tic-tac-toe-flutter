import 'package:flutter/material.dart';
import 'game_screen.dart';
import 'rules_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void openGame(BuildContext context, bool isSinglePlayer) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(isSinglePlayer: isSinglePlayer),
      ),
    );
  }

  void showDifficultyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1F2937),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Choose Difficulty',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Select your game level',
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const GameScreen(isSinglePlayer: true, isHard: false),
                  ),
                );
              },
              child: const Text(
                'Easy',
                style: TextStyle(color: Colors.greenAccent),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const GameScreen(isSinglePlayer: true, isHard: true),
                  ),
                );
              },
              child: const Text('Hard'),
            ),
          ],
        );
      },
    );
  }

  void showAboutDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1F2937),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'About Tic Tac Toe',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Tic Tac Toe is a simple strategy game. '
            'Make a line of three X or O symbols to win.',
            style: TextStyle(color: Colors.white70, height: 1.5),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 25),

              // App logo
              Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF2563EB), Color(0xFF7C3AED)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.25),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'X O',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Tic Tac Toe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Challenge your mind and enjoy the game!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 42),

              // Single Player
              _gameModeCard(
                title: 'Single Player',
                subtitle: 'Play against computer',
                icon: Icons.smart_toy_rounded,
                colors: const [Color(0xFF2563EB), Color(0xFF1D4ED8)],
                onTap: () {
                  showDifficultyDialog(context);
                },
              ),

              const SizedBox(height: 18),

              // Two Players
              _gameModeCard(
                title: 'Two Players',
                subtitle: 'Play with your friend',
                icon: Icons.people_alt_rounded,
                colors: const [Color(0xFFD97706), Color(0xFFB45309)],
                onTap: () {
                  openGame(context, false);
                },
              ),

              const SizedBox(height: 32),

              // About Game
              _actionButton(
                icon: Icons.info_outline_rounded,
                title: 'About Game',
                onTap: () {
                  showAboutDialogBox(context);
                },
              ),

              const SizedBox(height: 14),

              // How to Play
              _actionButton(
                icon: Icons.menu_book_rounded,
                title: 'How to Play',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RulesScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 28),

              const Text(
                'Have fun playing! 🎮',
                style: TextStyle(color: Colors.white38, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _gameModeCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: colors.first.withOpacity(0.25),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: Icon(icon, color: Colors.white, size: 30),
                  ),

                  const SizedBox(width: 18),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 19,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white,
          side: const BorderSide(color: Colors.white24, width: 1.2),
          backgroundColor: Colors.white.withOpacity(0.04),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
