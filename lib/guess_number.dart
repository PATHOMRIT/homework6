// ignore_for_file: avoid_print

import 'dart:io';

import 'package:homework6/game.dart';

void main() {
  var playAgain = true;
  do {
    playGame();
    var YesorNo = false;
    do {
      print('Play again? (Y/N) : ');
      var Contiguess = stdin.readLineSync();
      if (Contiguess == 'Y' ||
          Contiguess == 'y' ||
          Contiguess == 'N' ||
          Contiguess == 'n') {
        YesorNo = true;
        if (Contiguess == 'N' || Contiguess == 'n') {
          playAgain = false;
          print('║                 THANK YOU              ');
          print('╚════════════════════════════════════════');
          print("\nYou've played ${Game().getdoround.length} games.");
          for(int i=0;i<Game().getdoround.length;i++){
            print('🚀 Game #${i+1}: ${Game().getdoround[i]} guesses.');
          }
        }
      }
    } while (!YesorNo);
  } while (playAgain);
}

void playGame() {
  var isCorrect = false;
  stdout.write('Enter a maximum number to random : ');
  var inputNumber = int.tryParse(stdin.readLineSync()!);
  dynamic game;
  if (inputNumber != null) {
    game = Game(maxRandom: inputNumber);
  } else {
    game = Game();
  }
  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    int maxRandom = game.getmaxRandom();
    stdout.write('║ Guess the number between 1 and $maxRandom: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }
    var result = game.doGuess(guess);
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else {
      var Count = game.getdoCount();
      print('║ ➜ $guess is CORRECT ❤, total guesses: $Count');
      print('╟────────────────────────────────────────');
      isCorrect = true;
    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}
