import 'package:backery/pages/All/all_products_list.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/utils/colors.dart';
import 'package:backery/widgets/app_icon.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSilver,
      body: Container(
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                    margin: EdgeInsets.only(top: 45,bottom: 10),
                    padding: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     SizedBox(width: 8.0,),
                     GestureDetector(
                       onTap: () {
                         Get.toNamed(RouteHelper.initial);
                       },
                       child: AppIcon(icon: Icons.arrow_back,iconColor: Colors.white,backgroundColor: Colors.orange,)),
                      SizedBox(width: 8.0,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white
                        ),
                        child:  const TextField(
                          cursorColor: Color.fromRGBO(255, 141, 13, 1),
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(255, 141, 13, 1),
                              size: 25.0,
                              ),
                              border: InputBorder.none,
                              hintText: "Search For the Best",
                              hintStyle: TextStyle(color: Colors.black26,fontSize: 10)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.0,),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color.fromRGBO(255, 141, 13, 1),
                      ),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        ),
                    )
                  ],
                ),
                ),
                BigText(text: "All Products",color: Colors.black),
                SizedBox(height: 10,),
                Expanded(  
                    child: AllProductsList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}