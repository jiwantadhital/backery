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
import 'package:responsive_framework/responsive_framework.dart';

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
               builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],),
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

