import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {

final String text;
double size;
TextOverflow overflow;
Color color;
final height;

  SmallText({required this.text,this.size=12,this.overflow=TextOverflow.ellipsis,this.color=const Color(0xFF32d2b),this.height=1.2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: 'Roboto',
        fontSize: size,
      ),
    );
  }
}