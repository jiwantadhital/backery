import 'package:backery/utils/colors.dart';
import 'package:backery/widgets/icon_and_text_widget.dart';
import 'package:backery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {

final String text;
AppColumn({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: text,color: Colors.black),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Wrap(
                            children: 
                              List.generate(5, (index) => Icon(Icons.star_border_outlined,color: Colors.pink,size: 15,),),
                          ),
                           SizedBox(width: 10,),
                           SmallText(text: "4.5",color: Colors.black38,),
                           SizedBox(width: 20,),
                           SmallText(text: "1287",color: Colors.black38,),
                           SizedBox(width: 5,),
                           SmallText(text: "comments",color: Colors.black38,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(icon: Icons.circle_sharp, iconcolor: AppColors.iconColor1, text: "Normal"),
                          IconAndTextWidget(icon: Icons.location_on, iconcolor: Colors.pink.shade400, text: "1.7km"),
                          IconAndTextWidget(icon: Icons.access_time_rounded, iconcolor: AppColors.iconColor2, text: "32min"),
                        ],
                        )
                    ],
                  );
  }
}