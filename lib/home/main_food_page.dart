import 'package:backery/home/food_page_body.dart';
import 'package:backery/utils/colors.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:backery/widgets/drawer/drawer_items.dart';
import 'package:backery/widgets/small_text.dart';
import 'package:flutter/material.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({ Key? key }) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        width: 200,
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
          child: Container(
            margin: EdgeInsets.only(top: 30),
            child: Drawer(
            child:DrawerWidget(
            ),
            ),
          ),
        ),
      ),
      key: _scaffoldKey,
      backgroundColor: AppColors.kSilver,
      body: Column(
        children: 
            [
              Container(
                margin: EdgeInsets.only(top: 45,bottom: 15),
                padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(width: 8.0,),
                GestureDetector(
                  onTap: (){
                     _scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Icon(
                    Icons.list_outlined,
                    color:  Color.fromRGBO(255, 141, 13, 1),
                    ),
                ),
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
                ),
              ],
            ),
            ),
              FoodPageBody(),
          ],
      ),
    );
  }
}