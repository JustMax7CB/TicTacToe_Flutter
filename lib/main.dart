// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'gameMatrix.dart';
import 'Cell.dart';
import 'BottomText.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => TicTacToeState();
}

class TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe Flutter"),
          elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 14, 0, 20),
                  child: Game(),
                ),
                BottomText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<Cell> Matrix = GameMatrix().getCells();
  String currentPlayer = "X";

  String getCurrentPlayer() => currentPlayer;
  void setCurrentPlayer(String player) {
    setState(() {
      currentPlayer = player;
    });
  }

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < 9; i++) {
      Cell cell = Cell(value: "", bgColor: Colors.grey[200]!);
      Matrix.add(cell);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          "Its $currentPlayer Turn",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            letterSpacing: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 110,
              width: 110,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Matrix[0].bgColor,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    Turn(currentPlayer, 0);
                  },
                  child: Text(
                    Matrix[0].value,
                    style: TextStyle(
                      fontSize: 90,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 110,
                width: 110,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Matrix[1].bgColor,
                  ),
                  child: OutlinedButton(
                      onPressed: () {
                        Turn(currentPlayer, 1);
                      },
                      child: Text(
                        Matrix[1].value,
                        style: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      )),
                )),
            SizedBox(
                height: 110,
                width: 110,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Matrix[2].bgColor,
                  ),
                  child: OutlinedButton(
                      onPressed: () {
                        Turn(currentPlayer, 2);
                      },
                      child: Text(
                        Matrix[2].value,
                        style: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      )),
                )),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 110,
              width: 110,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Matrix[3].bgColor,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    Turn(currentPlayer, 3);
                  },
                  child: Text(
                    Matrix[3].value,
                    style: TextStyle(
                      fontSize: 90,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 110,
                width: 110,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Matrix[4].bgColor,
                  ),
                  child: OutlinedButton(
                      onPressed: () {
                        Turn(currentPlayer, 4);
                      },
                      child: Text(
                        Matrix[4].value,
                        style: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      )),
                )),
            SizedBox(
                height: 110,
                width: 110,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Matrix[5].bgColor,
                  ),
                  child: OutlinedButton(
                      onPressed: () {
                        Turn(currentPlayer, 5);
                      },
                      child: Text(
                        Matrix[5].value,
                        style: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      )),
                )),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 110,
              width: 110,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Matrix[6].bgColor,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    Turn(currentPlayer, 6);
                  },
                  child: Text(
                    Matrix[6].value,
                    style: TextStyle(
                      fontSize: 90,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
                height: 110,
                width: 110,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Matrix[7].bgColor,
                  ),
                  child: OutlinedButton(
                      onPressed: () {
                        Turn(currentPlayer, 7);
                      },
                      child: Text(
                        Matrix[7].value,
                        style: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      )),
                )),
            SizedBox(
                height: 110,
                width: 110,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Matrix[8].bgColor,
                  ),
                  child: OutlinedButton(
                      onPressed: () {
                        Turn(currentPlayer, 8);
                      },
                      child: Text(
                        Matrix[8].value,
                        style: TextStyle(
                          fontSize: 90,
                          color: Colors.white,
                        ),
                      )),
                )),
          ],
        ),
        SizedBox(height: 30),
        SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton(
            onPressed: resetGame,
            child: Text(
              "Reset Game",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.grey[350],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void resetGame() {
    setState(() {
      for (var i = 0; i < Matrix.length; i++) {
        Matrix[i].value = "";
        Matrix[i].bgColor = Colors.grey[200]!;
        currentPlayer = "X";
      }
    });
  }

  void Turn(String player, int index) {
    String winner = player;
    if (Matrix[index].value != "") {
      return;
    }
    setState(() {
      Matrix[index].value = player;
      Matrix[index].bgColor =
          currentPlayer == "X" ? Colors.orange : Colors.cyan;
      currentPlayer = currentPlayer == "X" ? "O" : "X";
    });
    checkWin(Matrix, winner);
  }

  void checkWin(List<Cell> mat, String player) {
    List<List<int>> winCellsIndex = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    for (var index = 0; index < winCellsIndex.length; index++) {
      List<int> indexes = winCellsIndex[index];
      if (mat[indexes[0]].value == player &&
          mat[indexes[1]].value == player &&
          mat[indexes[2]].value == player) {
        print("$player is the winner");
        Future.delayed(Duration(seconds: 1), () {
          resetGame();
        });
        return;
      }
    }
    bool DrawFlag = true;
    for (var i = 0; i < 9; i++) {
      if (mat[i].value == "") {
        DrawFlag = false;
      }
    }
    if (DrawFlag) {
      print("Its a Draw!!");
      Future.delayed(Duration(seconds: 1), () {
        resetGame();
      });
    }
  }
}
