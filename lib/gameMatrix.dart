import 'Cell.dart';

class GameMatrix {
  static List<Cell> cells = [];

  List<Cell> getCells() => cells;

  void setValue(int index, String player) {
    cells[index].value = player;
  }
}
