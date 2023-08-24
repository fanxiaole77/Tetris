import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled5/piece.dart';
import 'package:untitled5/pixel.dart';
import 'package:untitled5/values.dart';



class Demopage extends StatefulWidget {

  @override
  _DemopageState createState() => _DemopageState();
}

class _DemopageState extends State<Demopage> {


  //创建当前的俄罗斯方块
  piece currentPiece = piece(type: Tetromino.L);

  //当前分数
  int currentScore = 0;

  //游戏结束或者死亡
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    startGaem();
  }

  void startGaem() {
    currentPiece.initializePiece();

    //创建游戏循环
    Duration frameRate = const Duration(milliseconds: 400);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate){
    Timer.periodic(frameRate, (timer) {
      setState(() {
        clearLines();

        checkLanding();

        if(gameOver == true){
          timer.cancel();
          showGameOver();
        }

        currentPiece.movePiece(Direction.down);
      });
    });
  }

  //碰撞检测
  //return true -> 碰撞
  //return false  -> 没有碰撞
  bool checkCollsion(Direction direction){
    //循环遍历每个方块的位置
    for(int i= 0;i<currentPiece.position.length;i++){
      //计算当前的行和列
      int row = (currentPiece.position[i] / rowLength).floor();
      int col = currentPiece.position[i] % rowLength;

      if(direction == Direction.left){
        col -= 1;
      }else if(direction == Direction.right){
        col += 1;
      }else if(direction == Direction.down){
        row += 1;
      }
      //判断是否出界
      if(col < 0 || col >= rowLength || row >= colLength){
        return true;
      }
      if(row >= 0 && gameBoard[row][col] != null){
        return true;
      }
    }
    return false;
  }


  //到底部测试
  void checkLanding(){
    if(checkCollsion(Direction.down)){
      for(int i = 0; i<currentPiece.position.length;i++){
        int row = (currentPiece.position[i] / rowLength).floor();
        int col = currentPiece.position[i] % rowLength;
        if(row >= 0 && col >= 0){
          gameBoard[row][col] = currentPiece.type;
        }
      }
      //当到达底部时获取新的方块
      createNewPiece();
    }
  }
  //随机产生新的方块
  void createNewPiece(){

    //rand生成随机数
    Random rand = Random();

    Tetromino randomType = Tetromino.values[rand.nextInt(Tetromino.values.length)];
    currentPiece = piece(type: randomType);
    currentPiece.initializePiece();

    if(isGameOver()){
      gameOver = true;
    }
  }

  void moveLeft(){
    if(!checkCollsion(Direction.left)){
      setState(() {
        currentPiece.movePiece(Direction.left);
      });
    }
  }

  void moveRight(){
    if(!checkCollsion(Direction.right)){
      setState(() {
        currentPiece.movePiece(Direction.right);
      });
    }
  }

  void rotatePiece(){
    setState(() {
      currentPiece.rotatepiece();
    });
  }

  //清除方块
  void clearLines(){
    for(int row = colLength - 1;row >= 0; row--){
      bool rowIsFull = true;
      for(int col = 0;col<rowLength;col++){
        if(gameBoard[row][col] == null){
          rowIsFull = false;
          break;
        }
      }
      if(rowIsFull){
        for(int r = row; r > 0; r--){
          gameBoard[r] = List.from(gameBoard[r-1]);
        }
        gameBoard[0] = List.generate(row, (index) => null);
        currentScore++;
      }
    }
  }
  //结束游戏
  bool isGameOver(){
    for(int col = 0; col<rowLength;col++){
      if(gameBoard[0][col] != null){
        return true;
      }
    }
    return false;
  }
  //结束游戏弹窗
  void showGameOver(){
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("游戏结束"),
      content: Text("当前游戏分数：${currentScore}"),
      actions: [
        TextButton(onPressed: (){
          newGame();
          Navigator.pop(context);
        }, child: Text("重新开始"))
      ],
    ),);
  }
  //重制游戏
  void newGame(){
    gameBoard = List.generate(
      colLength,
          (i) => List.generate(
        rowLength,
            (j) => null,
      ),
    );
    //重制游戏分数
    gameOver =false;
    currentScore = 0;
    createNewPiece();
    startGaem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black, //背景颜色
      body:Container(
        decoration:  BoxDecoration(
          border: Border.all(
           width: 1,
           color: Colors.white
          )
        ),
        width: MediaQuery.of(context).size.width-500,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            GridView.builder(
              itemCount: rowLength * colLength,
              shrinkWrap: true,//展示所有
              physics:NeverScrollableScrollPhysics(),//禁止滚动
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rowLength,
                childAspectRatio: 2
              ),
              itemBuilder: (context, index){

                int row = (index/rowLength).floor();
                int col = index % rowLength;

                if(currentPiece.position.contains(index)){
                  return Pixel(
                      color: currentPiece.color,
                      child: index
                  );
                }
                else if(gameBoard[row][col] != null){
                  final Tetromino? tetrominoType = gameBoard[row][col];
                  return Pixel(color: tetromionColors[tetrominoType], child: '');
                }
                else{
                  return Pixel(
                      color: Colors.grey[900],
                      child: index
                  );
                }
              }
            ),
            SizedBox(
              height: 100,
            ),
            Text("当前分数:$currentScore",style: TextStyle(fontSize: 16,color: Colors.white),),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //左
                IconButton(onPressed: (){
                  moveLeft();
                }, icon:Icon(Icons.arrow_back_ios,color: Colors.white,)),
                //旋转
                IconButton(onPressed: (){
                  rotatePiece();
                }, icon:Icon(Icons.rotate_left,color: Colors.white,)),
                //右
                IconButton(onPressed: (){
                  moveRight();
                }, icon:Icon(Icons.arrow_forward_ios,color: Colors.white,)),
              ],
            )
          ],
        ),
      )
    );
  }
}
List<List<Tetromino?>> gameBoard = List.generate(
  colLength,
      (i) => List.generate(
    rowLength,
        (j) => null,
  ),
);
