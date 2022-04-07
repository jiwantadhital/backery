import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
final String text;
final String imgPath;

NoDataPage({required this.text,this.imgPath="assets/image/empty_cart.png"});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(imgPath,
        height: MediaQuery.of(context).size.height*0.22,
        width: MediaQuery.of(context).size.width*0.22,
        ),
        Text(text,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height*0.017,
            color: Colors.blueGrey,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}