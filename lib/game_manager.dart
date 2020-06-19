import 'dart:math';

class GameManager {
  String last_character = ' ';
  List<List<String>> field;
  int size;

  GameManager(int sizeOfField){
    size = sizeOfField;
    initField();
  }

  initField(){
    field = new List<List<String>>();

    for (var i = 0; i < size; i++) {
      List<String> list = new List<String>();
      for (var j = 0; j < size; j++) {
        list.add(' ');
      }
      field.add(list);
    }
  }

  updateField(int i, int j) {
    if (field[i][j] == ' ') {
      if (last_character == 'X') {
        field[i][j] = 'O';
      } else {
        field[i][j] = 'X';
      }
      last_character = field[i][j];
    }
  }

  checkDraw() {
    var draw = true;
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        if (field[i][j] == ' ')
          draw = false;
      }
    }
    return draw;
  }

  checkWinner(int x, int y){
    var col = 0, row = 0, diag = 0, rdiag = 0;
    var n = size-1;
    var player = field[x][y];

    for (int i = 0; i < size; i++) {
      if (field[x][i] == player)
        col++;
      if (field[i][y] == player)
        row++;
      if (field[i][i] == player)
        diag++;
      if (field[i][n-i] == player)
        rdiag++;
    }
    if (row == n+1 || col == n+1 || diag == n+1 || rdiag == n+1) {
      return true;
    }
    return false;
  }
}
