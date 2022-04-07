import 'package:backery/base/no_data_page.dart';
import 'package:backery/controllers/all_product_controller.dart';
import 'package:backery/controllers/auth_controller.dart';
import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/controllers/popular_product_controller.dart';
import 'package:backery/home/main_food_page.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:backery/utils/colors.dart';
import 'package:backery/widgets/app_icon.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:backery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 20,right: 20,top: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(RouteHelper.initial);
                },
                child: AppIcon(icon: Icons.arrow_back,
                iconColor: Colors.white,
                backgroundColor: Colors.orange,
                size: 24,
                ),
              ),
              SizedBox(width: 60,),
              AppIcon(icon: Icons.home_outlined,
              iconColor: Colors.white,
              backgroundColor: Colors.orange,
              size: 24,
              ),
              AppIcon(icon: Icons.shopping_cart,
              iconColor: Colors.white,
              backgroundColor: Colors.orange,
              size: 24,
              ),
            ]),
            ),
         GetBuilder<CartController>(builder: (_cartController){
           return _cartController.getItems.length>0? Positioned(
            top: 100,left: 20,right: 20,bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: 15),
              child: GetBuilder<CartController>(builder: (cartController){
                var _cartList = cartController.getItems;
                return MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                  itemCount:_cartList.length,
                  itemBuilder: (_,index){
                    return Container(
                      height: 100,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                             var popularIndex = Get.find<AllProductController>().allProductList.indexOf(_cartList[index].product!);
                             Get.toNamed(RouteHelper.getAllProductDetails(popularIndex));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                        AppConstants.BASE_URL+'/assets/images/'+cartController.getItems[index].img!),
                                  fit: BoxFit.cover,
                                  ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              // color: AppColors.kSilver,
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  BigText(text: _cartList[index].name!,color: Colors.black,),
                                  SmallText(text: "Spicy",color: Colors.black38,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(text: "Rs ${cartController.getItems[index].price}",color: Colors.red,),
                                      Container(
                                padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                                decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.white,
                                ),
                                child: Row(
                                            children: [
                                              GestureDetector(
                                                 onTap: () {
                                                   cartController.addItem(_cartList[index].product!, -1);
                                                },
                                                child: Icon(Icons.remove,
                                                color: AppColors.signColor,
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              BigText(text: _cartList[index].quantity.toString(),color: Colors.black,),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: () {
                                                  cartController.addItem(_cartList[index].product!, 1);
                                                },
                                                child: Icon(Icons.add,color: AppColors.signColor,))
                                            ],
                                ),
                              ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  ),
                );
              })
            ),
            ):NoDataPage(text: "Your Cart Is Empty");
         })
        ],
      ),
       bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
        return Container(
        height: 120,
        padding: EdgeInsets.only(top: 30,bottom: 30,left: 20,right: 20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
        ),
        child: cartController.getItems.length>0?Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  SizedBox(width: 5,),
                  BigText(text: "Rs ${cartController.totalAmount.toString()}",color: Colors.black,),
                  SizedBox(width: 5,),

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
              child: GestureDetector(
                onTap: (){
                  if(Get.find<AuthController>().userLoggedIn()){
                    cartController.addToHistory();
                  }
                  else{
                    Get.toNamed(RouteHelper.getSignIn());
                  }
                },
                child: BigText(text: "Check Out",color: Colors.white,)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange,
              ),
            ),
          ],
        ):Container(),
      );
 
      }),
    );
  }
}