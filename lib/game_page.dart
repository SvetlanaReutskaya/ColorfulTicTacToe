import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'color_generator.dart';
import 'game_manager.dart';

// Page with Tic Tac Toe game
class GamePage extends StatefulWidget {
  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  GameManager manager = new GameManager(3);
  ColorItem bgColor = ColorGenerator.GenerateNewColor();

  GamePageState() {
    manager.initField();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(
              bgColor.alpha, bgColor.red, bgColor.blue, bgColor.green),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  generateElement(0, 0),
                  generateElement(0, 1),
                  generateElement(0, 2)
                ]),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  generateElement(1, 0),
                  generateElement(1, 1),
                  generateElement(1, 2)
                ]),
                Row(mainAxisSize: MainAxisSize.min, children: [
                  generateElement(2, 0),
                  generateElement(2, 1),
                  generateElement(2, 2)
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // generate Tic Tac Toe interface cell
  generateElement(int i, int j) {
    return GestureDetector(
      onTap: () {
        setState(() {
          manager.updateField(i, j);
          if (manager.checkWinner(i, j)) {
            showWinnerDialog(manager.lastCharacter);
          } else if (!manager.checkPossibleMoves()) {
            showWinnerDialog(null);
          }
        });
      },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 10, color: Colors.white)),
        child: Center(
          child: Text(
            manager.field[i][j],
            style: TextStyle(fontSize: 60.0),
          ),
        ),
      ),
    );
  }

  // End game popUp
  showWinnerDialog(String winner) {
    String textInfo;
    if (winner == null) {
      textInfo = 'No winner!';
    } else {
      textInfo = 'Player $winner win!';
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('The game is over:'),
            content: Text(textInfo),
            actions: <Widget>[
              FlatButton(
                child: Text('Reset Game'),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    manager.initField();
                  });
                },
              )
            ],
          );
        });
  }
}
