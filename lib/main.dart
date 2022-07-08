// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'gameMatrix.dart';
import 'Cell.dart';

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
  int X_Wins = 0;
  int O_Wins = 0;

  String getCurrentPlayer() => currentPlayer;
  void setCurrentPlayer(String player) {
    setState(() {
      currentPlayer = player;
    });
  }

  @override
  void initState() {
    super.initState();
    X_Wins = 0;
    O_Wins = 0;
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
            generateCell(0),
            generateCell(1),
            generateCell(2),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            generateCell(3),
            generateCell(4),
            generateCell(5),
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            generateCell(6),
            generateCell(7),
            generateCell(8),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: newRound,
                child: Text(
                  "New Round",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[350],
                  ),
                ),
              ),
            ),
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
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
          child: BottomText(),
        )
      ],
    );
  }

  Column BottomText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "X Wins: $X_Wins",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "O Wins: $O_Wins",
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  SizedBox generateCell(int index) {
    return SizedBox(
      height: 110,
      width: 110,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Matrix[index].bgColor,
        ),
        child: OutlinedButton(
          onPressed: () {
            Turn(currentPlayer, index);
          },
          child: Text(
            Matrix[index].value,
            style: TextStyle(
              fontSize: 90,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void newRound() {
    setState(() {
      for (var i = 0; i < Matrix.length; i++) {
        Matrix[i].value = "";
        Matrix[i].bgColor = Colors.grey[200]!;
        currentPlayer = "X";
      }
    });
  }

  void resetGame() {
    newRound();
    setState(() {
      X_Wins = 0;
      O_Wins = 0;
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
        endAlert(context, "Win", player);
        setState(() {
          if (player == "X") {
            X_Wins++;
          } else {
            O_Wins++;
          }
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
      endAlert(context, "Draw", null);
    }
  }

  endAlert(BuildContext context, String status, String? winner) {
    Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          Future.delayed(Duration(seconds: 1), () {
            newRound();
          });
        });

    AlertDialog alert = AlertDialog(
      title: status == "Win" ? Text("There is a Winner!") : Text("Draw!"),
      content: status == "Win"
          ? Text("$winner is the winner of this Round")
          : Text("Game ended by Draw"),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
