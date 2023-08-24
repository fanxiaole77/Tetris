
import 'package:flutter/material.dart';

int rowLength = 10;  //横向的个数
int colLength = 15;  //竖向个数


enum Direction{ //移动方向
  left,
  right,
  down,
}

enum Tetromino{ //不同的方块形状
  L,
  J,
  I,
  O,
  S,
  Z,
  T,
}

const Map<Tetromino,Color> tetromionColors = {
  Tetromino.L:Colors.orange,
  Tetromino.J:Colors.green,
  Tetromino.I:Colors.red,
  Tetromino.O:Colors.yellow,
  Tetromino.S:Colors.blue,
  Tetromino.Z:Colors.purple,
  Tetromino.T:Colors.cyanAccent,
};