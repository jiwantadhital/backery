import 'package:backery/widgets/app_icon.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
AccountWidget({required this.appIcon,required this.bigText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
      child: Row(
        children: [
        appIcon,
        SizedBox(width: 20,),
        bigText,
      ]),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0,2),
            color: Colors.grey.withOpacity(0.2)
          ),
        ]
      ),
    );
  }
}