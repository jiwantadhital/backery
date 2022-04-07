import 'package:backery/base/no_data_page.dart';
import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:backery/widgets/app_icon.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:backery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList().reversed.toList();
    Map<String,int> cartItemsPerOrder = Map();
  for(int i=0;i<getCartHistoryList.length;i++){
    if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
      cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=> ++value);
    }
    else{
      cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1);
    }
  }
  List<int> cartOrderTimeToList(){
    return cartItemsPerOrder.entries.map((e)=>e.value).toList();
  }
  List<int> itemsPerOrder= cartOrderTimeToList();
  var listCounter=0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            height: 100,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History",color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,iconColor: Colors.orange,size: 30,),
              ],
            ),
          ),
        GetBuilder<CartController>(builder: (_cartController){
          return _cartController.getCartHistoryList().length>0?  Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: ListView(
                  children: [
                    for(int i=0;i<itemsPerOrder.length;i++)
                    Container(
                      // height: 80,
                      // margin: EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(text: "05/02/2021",color: Colors.black,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                direction: Axis.horizontal,
                                children: 
                                  List.generate(itemsPerOrder[i], (index){
                                    if(listCounter<getCartHistoryList.length){
                                      listCounter++;
                                    }
                                    return index<=2?Container(
                                      margin: EdgeInsets.only(right: 5),
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                      AppConstants.BASE_URL+'/assets/images/'+getCartHistoryList[listCounter-1].img!,
                                        ),
                                        fit: BoxFit.cover
                                        ),
                                      ),
                                    ):Container();
                                  })
                                ,
                              ),
                              Container(
                                height: 100,
                                child: Column(
                                  children: [
                                    SmallText(text: "Total",color: Colors.black26,),
                                    BigText(text: itemsPerOrder[i].toString()+" Items",color: Colors.black,),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(width: 1,color: Colors.orange),
                                      ),
                                      child: SmallText(text: "All More",color: Colors.orange,),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ):SizedBox(
            height: MediaQuery.of(context).size.height/1.5,
            child: Center(
              child: NoDataPage(
                text: "Cart History Is Empty",
                imgPath: "assets/image/empty_box.png",),
                ),
                );
        })
          ],
      ),
    );
  }
}