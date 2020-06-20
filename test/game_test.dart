import 'package:colorchangeflutterapp/game_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Check if moves saved correctly
  testWidgets('Players movement test', (WidgetTester tester) async {
    var manager = GameManager(3);
    int player1_x = 0, player1_y = 1, player2_x = 1, player2_y = 0;

    manager.updateField(player1_x, player1_y);
    expect(manager.field[player1_x][player1_y], 'X');

    manager.updateField(player2_x, player2_y);
    expect(manager.field[player2_x][player2_y], 'O');
  });

  // Check win system
  testWidgets('Player win test', (WidgetTester tester) async {
    var manager = GameManager(3);
    int player1_x1 = 0,
        player1_y1 = 0,
        player2_x1 = 1,
        player2_y1 = 0,
        player1_x2 = 0,
        player1_y2 = 1,
        player2_x2 = 1,
        player2_y2 = 1,
        player1_x3 = 0,
        player1_y3 = 2;

    manager.updateField(player1_x1, player1_y1);
    expect(manager.checkWinner(player1_x1, player1_y1), false);

    manager.updateField(player2_x1, player2_y1);
    expect(manager.checkWinner(player2_x1, player2_y1), false);

    manager.updateField(player1_x2, player1_y2);
    expect(manager.checkWinner(player1_x2, player1_y2), false);

    manager.updateField(player2_x2, player2_y2);
    expect(manager.checkWinner(player2_x2, player2_y2), false);

    manager.updateField(player1_x3, player1_y3);
    expect(manager.checkWinner(player1_x3, player1_y3), true);
  });

  // Check clearing game table
  testWidgets('Init field test', (WidgetTester tester) async {
    var manager = GameManager(3);
    int player1_x1 = 1, player1_y1 = 2;

    manager.updateField(player1_x1, player1_y1);
    expect(manager.field[player1_x1][player1_y1], 'X');
    manager.initField();
    expect(manager.field[player1_x1][player1_y1], ' ');
  });

  // Check pat situation
  testWidgets('Check possible moves test', (WidgetTester tester) async {
    var manager = GameManager(3);
    int player1_x1 = 0,
        player1_y1 = 0,
        player2_x1 = 1,
        player2_y1 = 0,
        player1_x2 = 0,
        player1_y2 = 1,
        player2_x2 = 1,
        player2_y2 = 1,
        player1_x3 = 1,
        player1_y3 = 2,
        player2_x3 = 0,
        player2_y3 = 2,
        player1_x4 = 2,
        player1_y4 = 0,
        player2_x4 = 2,
        player2_y4 = 2,
        player1_x5 = 2,
        player1_y5 = 1;

    manager.updateField(player1_x1, player1_y1);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player2_x1, player2_y1);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player1_x2, player1_y2);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player2_x2, player2_y2);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player1_x3, player1_y3);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player2_x3, player2_y3);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player1_x4, player1_y4);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player2_x4, player2_y4);
    expect(manager.checkPossibleMoves(), true);

    manager.updateField(player1_x5, player1_y5);
    expect(manager.checkPossibleMoves(), false);
  });
}
