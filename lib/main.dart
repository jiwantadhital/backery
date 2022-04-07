import 'package:backery/controllers/all_product_controller.dart';
import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/controllers/popular_product_controller.dart';
import 'package:backery/controllers/recent_product_controllers.dart';
import 'package:backery/home/main_food_page.dart';
import 'package:backery/pages/All/all_products.dart';
import 'package:backery/pages/account/auth/sign_in_page.dart';
import 'package:backery/pages/popular_product_detail.dart';
import 'package:backery/pages/splash/splash_page.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Get.find<CartController>().getCartData();
   Get.find<RecentProductController>().getrecentProductList();
   Get.find<AllProductController>().getallProductList();
    return GetBuilder<CartController>(builder: (_){
      // return GetBuilder<PopularProductController>(builder: (_){
        return GetBuilder<RecentProductController>(builder: (_){
          return GetBuilder<AllProductController>(builder: (_){
            return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.getSplashPage(),
      getPages: RouteHelper.routes,
    );
        });
          });
      },);
    // });
  }
}

