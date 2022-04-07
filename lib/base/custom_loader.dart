import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height : 100,
        width : 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.orange,
        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}