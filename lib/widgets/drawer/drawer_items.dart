import 'package:backery/controllers/auth_controller.dart';
import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/pages/All/all_products.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/widgets/drawer/drawer_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({ Key? key }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
              padding: EdgeInsets.zero,
              children: [
                 DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 10,
                        spreadRadius: 7,
                      )
                    ]
                  ),
                  child: Image.asset("assets/image/gtech.png",fit: BoxFit.cover,),
                ),
                SizedBox(height: 10,),
               DrawerList(icon: Icons.all_inbox_outlined,iconColor: Colors.orange, text: "All Items",tap: (){Get.toNamed(RouteHelper.getAllProduct());},),
              DrawerList(icon: Icons.favorite,text: "Favourites",iconColor: Colors.orange,),
               DrawerList(icon: Icons.help,text: "Help",iconColor: Colors.orange,tap: (){Get.toNamed(RouteHelper.getAboutUs());}),
               DrawerList(icon: Icons.support, text: "Support",iconColor: Colors.orange,),
               DrawerList(icon: Icons.system_security_update_good, text: "Terms and Condition",iconColor: Colors.orange,tap: (){Get.toNamed(RouteHelper.getTermsPage());},),
                GestureDetector(
                   onTap: (){
                  if(Get.find<AuthController>().userLoggedIn()){
                    Get.find<AuthController>().clearSharedData();
                    Get.offNamed(RouteHelper.signIn);
                    Get.find<CartController>().clear();
                    Get.find<CartController>().clearCartHistory();
                  }
                },
                  child: DrawerList(icon: Icons.logout_sharp,text: "Logout",iconColor: Colors.orange,)),
              ],
            );
  }
}