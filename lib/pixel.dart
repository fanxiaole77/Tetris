import 'package:flutter/material.dart';


// 背景颜色*/

class Pixel extends StatelessWidget {
  var color;
  var child;
  Pixel({required this.color,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4)
      ),
      margin: EdgeInsets.all(1),
      child: Center(
        child:Text(child.toString(),style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
