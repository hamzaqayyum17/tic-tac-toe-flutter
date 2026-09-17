# 🎮 Tic Tac Toe Flutter Game

A modern Tic Tac Toe game developed using **Flutter and Dart**, featuring Single Player and Two Player modes.

The game includes an intelligent computer opponent with **Easy and Hard difficulty levels**, score tracking, draw detection, game rules, and a clean dark user interface.

---

## ✨ Features

### 🎯 Game Modes

#### Single Player

* Play against the computer
* Easy difficulty with random computer moves
* Hard difficulty using the Minimax algorithm

#### Two Players

* Play locally with another player
* Automatic X/O turn switching

### 🧠 Computer AI

* Easy mode uses random moves
* Hard mode uses the **Minimax algorithm**
* Computer can:

  * Block the player's winning move
  * Select winning moves
  * Avoid unnecessary losses

### 📊 Game Features

* X and O turn tracking
* Player scoreboard
* Draw counter
* Win detection
* Draw detection
* Restart game
* New game option
* Game-over dialog
* Game rules screen
* About Game information

### 🎨 User Interface

* Modern dark theme
* Responsive game board
* Animated board cells
* Color-coded X and O
* Clean and simple navigation

---

## 🛠️ Technologies

* **Flutter**
* **Dart**
* **Material Design**
* **Minimax Algorithm**

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
│
assets/
└── icon/
    └── app_icon.png
```

---

## ▶️ How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/hamzaqayyum17/tic-tac-toe-flutter.git
```

### 2. Open the Project

```bash
cd tic-tac-toe-flutter
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run the Application

```bash
flutter run
```

---

## 📱 Build APK

To generate a release APK, run:

```bash
flutter build apk --release
```

The APK will be generated at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

## 🧩 Difficulty Levels

| Difficulty | Description                                             |
| ---------- | ------------------------------------------------------- |
| Easy       | Computer selects random available moves                 |
| Hard       | Computer uses the Minimax algorithm for strategic moves |

---

## 🎮 How to Play

1. Select **Single Player** or **Two Players**.
2. In Single Player mode, choose Easy or Hard difficulty.
3. Tap an empty cell to place X or O.
4. Make three symbols in a row, column, or diagonal to win.
5. If all cells are filled without a winner, the game is a draw.
6. Use the restart option to start a new round.

---

## 📌 Future Improvements

* Online multiplayer mode
* Player login and profiles
* Leaderboard system
* Game history
* Sound effects
* More themes
* Difficulty statistics

---

## 👨‍💻 Author

**Hamza Qayyum**

GitHub: [hamzaqayyum17](https://github.com/hamzaqayyum17)

---

## 📄 License

This project is created for learning, practice, and portfolio purposes.
