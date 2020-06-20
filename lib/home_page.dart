import 'package:flutter/material.dart';
import 'game_page.dart';
import 'color_generator.dart';

// Page with color change.
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  ColorItem bgColor = ColorGenerator.GenerateNewColor();
  int counter = 0;

  // Set random bgColor
  void setRandomColor() {
    setState(() {
      bgColor = ColorGenerator.GenerateNewColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            setRandomColor();
            counter++;
            if (counter == 3) {
              counter = 0;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => GamePage()),
                ModalRoute.withName('/GamePage'),
              );
            }
          });
        },
        child: Container(
          color: Color.fromARGB(
              bgColor.alpha, bgColor.red, bgColor.blue, bgColor.green),
          child: Center(
            child: Text(
              'Hey there \nTap 3 times to play TicTacToe',
            ),
          ),
        ),
      ),
    );
  }
}
