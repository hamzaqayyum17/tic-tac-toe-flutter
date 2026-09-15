# 🎮 Tic Tac Toe Flutter Game

A modern Tic Tac Toe game developed using **Flutter and Dart** with Single Player and Two Player modes.

The game features an intelligent computer opponent with **Easy and Hard difficulty levels**, score tracking, draw detection, game rules, and a clean dark user interface.

---

## ✨ Features

### 🎯 Game Modes

- **Single Player**
  - Play against the computer
  - Easy difficulty
  - Hard difficulty with Minimax AI

- **Two Players**
  - Play locally with another player
  - Automatic X/O turn switching

### 🧠 Computer AI

- Easy mode uses random moves
- Hard mode uses the **Minimax algorithm**
- Computer can:
  - Block the player's winning move
  - Select winning moves
  - Avoid unnecessary losses

### 📊 Game Features

- X and O turn tracking
- Player scoreboard
- Draw counter
- Win detection
- Draw detection
- Restart game
- New game option
- Game-over dialog
- Game rules screen
- About Game information

### 🎨 User Interface

- Modern dark theme
- Responsive game board
- Animated board cells
- Color-coded X and O
- Clean and simple navigation

---

## 🛠️ Technologies

- **Flutter**
- **Dart**
- **Material Design**
- **Minimax Algorithm**

---

## 📁 Project Structure

```text
lib/
│
├── main.dart
│
├── screens/
│   ├── home_screen.dart
│   ├── game_screen.dart
│   └── rules_screen.dart