// import 'package:backery/controllers/cart_controllers.dart';
// import 'package:backery/controllers/popular_product_controller.dart';
// import 'package:backery/home/main_food_page.dart';
// import 'package:backery/pages/cart/cart_page.dart';
// import 'package:backery/routes/route_helper.dart';
// import 'package:backery/utils/colors.dart';
// import 'package:backery/widgets/app_column.dart';
// import 'package:backery/widgets/app_icon.dart';
// import 'package:backery/widgets/big_text.dart';
// import 'package:backery/widgets/expandable_text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class PopularProductDetails extends StatelessWidget {
// int pageId;
// PopularProductDetails({required this.pageId});
//   @override
//   Widget build(BuildContext context) {
//     var product = Get.find<PopularProductController>().popularProductList[pageId];
//     Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());
//     return Scaffold(
//       body: Column(
//         children: 
//           [
//             Container(
//             height: 460,
//             child: Stack(
//               children: 
//                 [
//                   Positioned(
//                         child: Container(
//                   width: double.maxFinite,
//                   height: 350,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                         product.img!
//                       ),
//                       )
//                   ),
//                         ),
//                         ),
//                     Positioned(
//                       left: 20,right: 20,top: 45,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Get.toNamed(RouteHelper.getInitial());
//                             },
//                             child: AppIcon(icon: Icons.arrow_back),),
//                           GetBuilder<PopularProductController>(builder: ((controller) {
//                             return Stack(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     Get.toNamed(RouteHelper.cartPage);
//                                   },
//                                   child: AppIcon(icon: Icons.shopping_cart)),
//                                 Get.find<PopularProductController>().totalItems>=1?
//                                 Positioned(
//                                   right: 0,top: 0,
//                                   child: AppIcon(icon: Icons.circle,size: 20,iconColor: Colors.transparent,backgroundColor: Colors.orange,),
//                                   ):
//                                 Container(),
//                                  Get.find<PopularProductController>().totalItems>=1?
//                                 Positioned(
//                                   right: 5,top: 3,
//                                   child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
//                                   size: 12,color: Colors.white,
//                                   ),
//                                   ):
//                                 Container(),
//                               ],
//                             );
//                           }),),
//                         ],
//                       ),
//                       ),
//                  Stack(
//                    children: 
//                         [
//                           Positioned(
//                           top: 330,left: 0,right: 0,
//                           child: Container(
//                             padding: EdgeInsets.only(left: 20,right: 20,top: 20),
//                             decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: AppColors.kSilver,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   AppColumn(text: product.name!),
//                                   SizedBox(height: 10,)
//                                   ],
//                                   ),
//                                     ),
//                         ),
//                       ],
//                  ),
//               ],
//             ),
//           ),
//           Container(
//             child: Expanded(
//               child: SingleChildScrollView(
//                 physics: BouncingScrollPhysics(),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                   Padding(
//                     padding: EdgeInsets.only(left: 20,right: 20),
//                     child: BigText(text: "Description",color: Colors.black,),
//                     ),
//                   ExpandableTextWidget(text: product.description!)
//                 ],),
//               ),
//             )
//           )
//         ],
//       ),
//       bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
//         return Container(
//         height: 120,
//         padding: EdgeInsets.only(top: 30,bottom: 30,left: 20,right: 20),
//         decoration: BoxDecoration(
//           color: AppColors.buttonBackgroundColor,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//               ),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                      onTap: () {
//                       popularProduct.setQuantity(false);
//                     },
//                     child: Icon(Icons.remove,
//                     color: AppColors.signColor,
//                     ),
//                   ),
//                   SizedBox(width: 5,),
//                   BigText(text: popularProduct.inCartItems.toString(),color: Colors.black,),
//                   SizedBox(width: 5,),
//                   GestureDetector(
//                     onTap: () {
//                       popularProduct.setQuantity(true);
//                     },
//                     child: Icon(Icons.add,color: AppColors.signColor,))
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(top: 20,bottom: 20,left: 20,right: 20),
//               child: GestureDetector(
//                 onTap: (){
//                   popularProduct.addItem(product);
//                 },
//                 child: BigText(text: "\$${product.price} | Add to Cart",color: Colors.white,)),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.orange,
//               ),
//             ),
//           ],
//         ),
//       );
 
//       })
//          );
//   }
// }