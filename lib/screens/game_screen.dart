import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final bool isSinglePlayer;

  const GameScreen({super.key, required this.isSinglePlayer});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // 9 board cells.
  List<String> board = List.filled(9, '');

  // X = Player, O = Computer or Player 2.
  String currentPlayer = 'X';

  bool gameOver = false;
  bool computerThinking = false;
  int xScore = 0;
  int oScore = 0;
  int drawScore = 0;

  // Human player move.
  void makeMove(int index) {
    // Game finished or computer is thinking.
    if (gameOver || computerThinking) {
      return;
    }

    // Cell already occupied.
    if (board[index].isNotEmpty) {
      return;
    }

    setState(() {
      board[index] = currentPlayer;
    });

    // Check winner.
    if (checkWinner(currentPlayer)) {
      gameOver = true;

      if (currentPlayer == 'X') {
        xScore++;
      } else {
        oScore++;
      }

      showGameOverDialog('$currentPlayer Wins!');
      return;
    }

    // Check draw.
    if (!board.contains('')) {
      gameOver = true;
      drawScore++;
      showGameOverDialog('It\'s a Draw!');
      return;
    }
    // Single Player mode.
    if (widget.isSinglePlayer) {
      setState(() {
        currentPlayer = 'O';
        computerThinking = true;
      });

      computerMove();
    } else {
      // Two Player mode.
      setState(() {
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
    }
  }

  // Computer automatic move.
  Future<void> computerMove() async {
    await Future.delayed(const Duration(milliseconds: 600));

    // If user restarted or game ended during delay.
    if (!mounted || gameOver) {
      return;
    }

    // Find empty cells.
    final emptyCells = <int>[];

    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        emptyCells.add(i);
      }
    }

    // No empty cell available.
    if (emptyCells.isEmpty) {
      return;
    }

    // Simple AI: choose the first available empty cell.
    final computerIndex = findBestMove();

    setState(() {
      board[computerIndex] = 'O';
      computerThinking = false;
    });

    // Check computer winner.
    if (checkWinner('O')) {
      gameOver = true;
      oScore++;
      showGameOverDialog('Computer Wins!');
      return;
    }

    // Check draw.
    if (!board.contains('')) {
      gameOver = true;
      drawScore++;
      showGameOverDialog('It\'s a Draw!');
      return;
    }

    // Back to player's turn.
    setState(() {
      currentPlayer = 'X';
    });
  }

  int findBestMove() {
    // 1. Check if computer can win.
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        board[i] = 'O';

        if (checkWinner('O')) {
          board[i] = '';
          return i;
        }

        board[i] = '';
      }
    }

    // 2. Check if player can win, then block player.
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        board[i] = 'X';

        if (checkWinner('X')) {
          board[i] = '';
          return i;
        }

        board[i] = '';
      }
    }

    // 3. Choose center.
    if (board[4].isEmpty) {
      return 4;
    }

    // 4. Choose a corner.
    const corners = [0, 2, 6, 8];

    for (final corner in corners) {
      if (board[corner].isEmpty) {
        return corner;
      }
    }

    // 5. Choose any available cell.
    for (int i = 0; i < board.length; i++) {
      if (board[i].isEmpty) {
        return i;
      }
    }

    // Fallback.
    return 0;
  }

  // Check winning combinations.
  bool checkWinner(String player) {
    const winningCombinations = [
      // Rows
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],

      // Columns
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],

      // Diagonals
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (final combination in winningCombinations) {
      if (board[combination[0]] == player &&
          board[combination[1]] == player &&
          board[combination[2]] == player) {
        return true;
      }
    }

    return false;
  }

  // Restart game.
  void restartGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
      gameOver = false;
      computerThinking = false;
    });
  }

  // Game over dialog.
  void showGameOverDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Game Over'),
          content: Text(
            message,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                restartGame();
              },
              child: const Text('New Game'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),

      appBar: AppBar(
        backgroundColor: const Color(0xFF111827),
        foregroundColor: Colors.white,
        title: Text(widget.isSinglePlayer ? 'Single Player' : 'Two Players'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),

        child: Column(
          children: [
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _scoreCard(
                  title: 'Player X',
                  score: xScore,
                  color: const Color(0xFF60A5FA),
                ),

                _scoreCard(
                  title: 'Draws',
                  score: drawScore,
                  color: Colors.white,
                ),

                _scoreCard(
                  title: widget.isSinglePlayer ? 'Computer' : 'Player O',
                  score: oScore,
                  color: const Color(0xFFFBBF24),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: currentPlayer == 'X'
                    ? const Color(0xFF1D4ED8)
                    : const Color(0xFFB45309),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                computerThinking
                    ? 'Computer Thinking...'
                    : 'Player $currentPlayer Turn',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Tic Tac Toe board.
            Expanded(
              child: GridView.builder(
                itemCount: 9,

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),

                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      makeMove(index);
                    },

                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      decoration: BoxDecoration(
                        color: board[index].isEmpty
                            ? const Color(0xFF1F2937)
                            : const Color(0xFF374151),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: board[index] == 'X'
                              ? const Color(0xFF60A5FA)
                              : board[index] == 'O'
                              ? const Color(0xFFFBBF24)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          board[index],
                          style: TextStyle(
                            color: board[index] == 'X'
                                ? const Color(0xFF60A5FA)
                                : const Color(0xFFFBBF24),
                            fontSize: 52,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Restart button.
            // Restart button.
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: restartGame,
                icon: const Icon(Icons.refresh),
                label: const Text(
                  'Restart Game',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _scoreCard({
    required String title,
    required int score,
    required Color color,
  }) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$score',
            style: TextStyle(
              color: color,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
