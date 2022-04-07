import 'dart:async';
import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/controllers/popular_product_controller.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource()async{
    // await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<CartController>().cartRepo;
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 2))..forward();
    animation= CurvedAnimation(parent: controller, curve: Curves.easeInToLinear);
    Timer(Duration(seconds: 3),
    ()=>Get.offNamed(RouteHelper.getInitial())
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
            child: Center(
              child: Image.asset("assets/image/gtech.png",width: 200,),
              ),
          ),
        ],
      ),
    );
  }
}