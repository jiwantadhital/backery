import 'package:backery/controllers/all_product_controller.dart';
import 'package:backery/controllers/popular_product_controller.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:backery/utils/colors.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:backery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSilver,
        body: Container(
          padding: EdgeInsets.only(left: 10,right: 10),
          child: MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: GetBuilder<AllProductController>(builder: (allProducts){
              return allProducts.isLoaded?ListView(
                physics: BouncingScrollPhysics(),
              children: <Widget>[
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: allProducts.allProductList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: GestureDetector(
                        onTap: (){
                        Get.toNamed(RouteHelper.getAllProductDetails(index));
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      image: DecorationImage(image:NetworkImage(
                                        AppConstants.BASE_URL+'/assets/images/'+allProducts.allProductList[index].thumbnail.toString(),
                                      ),
                                      fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 5,bottom: 3),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                      ),
                                      margin: EdgeInsets.only(top: 140),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                            Wrap(
                                                  children: 
                                                  List.generate(5, (index) => Icon(Icons.star_border_outlined,color: Colors.pink,size: 15,),),
                                                    ),
                                                    BigText(text: "(0)",color: Colors.black38,)
                                          ],
                                          ),
                                          SizedBox(height: 4,),
                                          Row(
                                            children: [
                                              Container(
                                                width: 170,
                                                child: BigText(text:allProducts.allProductList[index].name!,color: Colors.black,overflow: TextOverflow.ellipsis,)),
                                            ],
                                          ),
                                          SizedBox(height: 4,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              BigText(text:"Rs ${allProducts.allProductList[index].discountPrice.toString()}",color: Colors.orange,),
                                            ],
                                          ),
                                          SizedBox(height: 2,),
                                          Row(
                                            children: [
                                              SmallText(text: "In stock: ${allProducts.allProductList[index].stock!}",color: Colors.black26,)
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ), 
              ],
            ):CircularProgressIndicator();
            },),
          ),
        ),
      );
  }
}
