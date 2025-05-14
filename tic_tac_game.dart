import 'dart:io';

void main() {
  while (true) {
    generateBoard();
    getChar();
    print('\nWould you like to play again? (y/n)');
    final playAgain = stdin.readLineSync()?.toLowerCase();
    if (playAgain != 'y') {
      print('Thanks for playing! Goodbye.');
      break;
    }
    values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    winner = false;
    isXturn = true;
    moveCount = 0;
  }
}

List<String> values = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
List<String> combinations = ['012','345','678','036','147','258','048','246'];

bool winner = false;
bool isXturn = true;
int moveCount = 0;

bool checkCombination(String combination, String player) {
  List<int> indices = combination.split('').map(int.parse).toList();
  return indices.every((index) => values[index] == player);
}

void checkWinner(String player) {
  for (final combo in combinations) {
    if (checkCombination(combo, player)) {
      print('$player wins!');
      winner = true;
      return;
    }
  }
}

void getChar() {
  print('Choose a number for ${isXturn ? 'X' : 'O'}: ');
  int number = int.parse(stdin.readLineSync() ?? '-1');

  if (number < 1 || number > 9 || values[number - 1] == 'X' || values[number - 1] == 'O') {
    print('Invalid input. Try again please');
    getChar();
    return;
  }

  values[number - 1] = isXturn ? 'X' : 'O';
  moveCount++;
  generateBoard();

  checkWinner('X');
  checkWinner('O');

  if (winner) return;

  if (moveCount == 9) {
    print('It\'s a draw!');
    winner = true;
    return;
  }

  isXturn = !isXturn;
  getChar();
}

void generateBoard() {
  print('\nCurrent Board:\n');
  print('  ${values[0]}  |  ${values[1]}  |  ${values[2]}  ');
  print('-----+-----+-----');
  print('  ${values[3]}  |  ${values[4]}  |  ${values[5]}  ');
  print('-----+-----+-----');
  print('  ${values[6]}  |  ${values[7]}  |  ${values[8]}  ');
}