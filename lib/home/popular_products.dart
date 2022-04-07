import 'package:backery/controllers/popular_product_controller.dart';
import 'package:backery/controllers/recent_product_controllers.dart';
import 'package:backery/pages/popular_product_detail.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:flutter/material.dart';
import '../widgets/big_text.dart';
import '../widgets/small_text.dart';
import 'package:get/get.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({ Key? key }) : super(key: key);

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecentProductController>(builder: (recentProducts){
                  return recentProducts.isLoaded?MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView.builder(
                      shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: recentProducts.recentProductList.length,
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
                            child: GestureDetector(
                               onTap: () {
                        Get.toNamed(RouteHelper.getPopularProduct(index));
                      },
                              child: Row(
                                children: 
                                  [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white38,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            AppConstants.BASE_URL+'/assets/images/'+recentProducts.recentProductList[index].photo.toString(),
                          ),
                          ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text:recentProducts.recentProductList[index].name!,color: Colors.black,),
                              SizedBox(height: 5,),
                              SmallText(text: recentProducts.recentProductList[index].details!,color: Colors.black26,),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                                ],
                              ),
                            ),
                          );
                      }),
                  ):CircularProgressIndicator(color: Colors.orange,);
                }); 
    
       }
}