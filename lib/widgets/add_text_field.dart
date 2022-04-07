import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
final TextEditingController textController;
final String hintText;
final IconData icon;

AppTextField({required this.textController,required this.hintText,required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 7,
                  offset: Offset(1,10),
                  color: Colors.grey.withOpacity(0.2),
                )
              ],
            ),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(icon,color: Colors.orange,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 10,
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 10,
                    color: Colors.white,
                  ),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 10,
                    color: Colors.white,
                  ),
            ),
          ),
          ),
          );
  }
}