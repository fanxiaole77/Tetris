import 'package:flutter/material.dart';
import 'package:untitled5/DemoPage.dart';
import 'package:untitled5/values.dart';

class piece{
 //判断方块类型
  Tetromino type;

  piece({required this.type});

  //整数列表
  List<int> position = [];

  Color get color{
    return tetromionColors[type] ?? Colors.white;
  }

  void initializePiece(){
    switch(type){
      case Tetromino.L:
        position = [
          -26,
          -16,
          -6,
          -5
        ];
        break;
      case Tetromino.J:
        position = [
          -25,
          -15,
          -5,
          -6
        ];
        break;
      case Tetromino.I:
        position = [
          -4,
          -5,
          -6,
          -7
        ];
        break;
      case Tetromino.O:
        position = [
          -15,
          -16,
          -5,
          -6
        ];
        break;
      case Tetromino.S:
        position = [
          -15,
          -14,
          -6,
          -5
        ];
        break;
      case Tetromino.Z:
        position = [
          -17,
          -16,
          -6,
          -5
        ];
        break;
      case Tetromino.T:
        position = [
          -26,
          -16,
          -6,
          -15
        ];
        break;
    }
  }

  void movePiece(Direction direction){
    switch(direction){
      case Direction.down:
        for(int i =0;i<position.length;i++){
          position[i] += rowLength;
        }
        break;
      case Direction.left:
        for(int i =0;i<position.length;i++){
          position[i] -= 1;
        }
        break;
      case Direction.right:
        for(int i =0;i<position.length;i++){
          position[i] += 1;
        }
        break;
    }
  }

  int rotationState = 1;

  void rotatepiece(){
    List<int> newPosition = [];

    switch(type){
      case Tetromino.L:
        switch(rotationState){
          case 0:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + rowLength + 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - rowLength - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - rowLength + 1,
              position[1],
              position[1] + 1,
              position[1] - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.J:
        switch(rotationState){
          case 0:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + rowLength + 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - rowLength - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - rowLength + 1,
              position[1],
              position[1] + 1,
              position[1] - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.Z:
        switch(rotationState){
          case 0:
            newPosition = [
              position[0] + rowLength - 2,
              position[1],
              position[2] + rowLength - 1,
              position[3] + 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[0] - rowLength + 2,
              position[1],
              position[2] - rowLength - 1,
              position[3] - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[0] + rowLength - 2,
              position[1],
              position[2] + rowLength,
              position[3] + 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[0] - rowLength + 2,
              position[1],
              position[2] - rowLength + 1,
              position[3] - 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.S:
        switch(rotationState){
          case 0:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
              position[1] + rowLength ,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + 1,
              position[1] + rowLength + 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLength - 1,
              position[1] + rowLength,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + 1,
              position[1] + rowLength + 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.I:
        switch(rotationState){
          case 0:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + 2 * rowLength,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + rowLength,
              position[1] + 2 * rowLength,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] - 2,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] + rowLength,
              position[1],
              position[1] - rowLength,
              position[1] - 2 * rowLength,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.T:
        switch(rotationState){
          case 0:
            newPosition = [
              position[1] - rowLength,
              position[1],
              position[1] + 1,
              position[1] + rowLength,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLength,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] - rowLength,
              position[1] - 1,
              position[1],
              position[1] + rowLength,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - rowLength,
              position[1] - 1,
              position[1],
              position[1] + 1,
            ];
            if(piecPositionIsVald(newPosition)){
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }
        break;
    }
  }

  bool postionIsVald(int position){
    int row = (position/rowLength).floor();
    int col = position % rowLength;
    if(row < 0 || gameBoard[row][col] != null){
      return false;
    }else{
      return true;
    }

  }

  bool piecPositionIsVald(List<int> piecePostion){
    bool firstColOccupied = false;
    bool lastColOccupied = false;
    for(int pos in piecePostion){
      if(!postionIsVald(pos)){
        return false;
      }
      int col = pos % rowLength;
      if(col == 0){
        firstColOccupied = true;
      }
      if(col == rowLength -1){
        lastColOccupied = true;
      }
    }
    return !(firstColOccupied && lastColOccupied);
  }

}