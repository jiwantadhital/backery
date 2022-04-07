import 'package:backery/home/categories.dart';
import 'package:backery/home/changer.dart';
import 'package:backery/home/popular_products.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/utils/colors.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:backery/widgets/icon_and_text_widget.dart';
import 'package:backery/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({ Key? key }) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  
  PageController pageController = PageController(viewportFraction: 0.92);

  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 150;
  int countItem =5;

  @override
  void initState() {
        super.initState();
    pageController.addListener(() { 
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: 
            [
              Container(
              height: 150,
              child: PageView.builder(
                controller: pageController,
                itemCount: countItem,
                itemBuilder: (context,position){
                  return _buildPageItem(position);
                },
                ),
            ),
              DotsIndicator(
               dotsCount: countItem,
               position: _currPageValue,
               decorator: DotsDecorator(
                 activeColor: Color.fromRGBO(255, 141, 13, 1),
                 size: const Size.square(5.0),
                 activeSize: const Size(10.0, 5.0),
                 activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
               ),
              ),
              Categories(),
              Container(
                margin: EdgeInsets.only(left: 0),
                child: Container(
                  padding: EdgeInsets.only(bottom: 5,top: 5,left: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                     BoxShadow(
                    blurRadius: 1,
                    offset: Offset(0,2),
                    color: Colors.grey.withOpacity(0.2)
                      ),
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   BigText(text: "Recent Products",color: Colors.black,size: 20,),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getAllProduct());
                        },
                        child: 
                        Text(
                          "See All >>",
                          style: TextStyle(color: Color.fromRGBO(255, 141, 13, 1,),fontSize: 20
                          ),
                          ),
                          ),
                    ),
                    ],
                    ),
                ),
              ),
                SizedBox(height: 10,),
                PopularProducts(),  
              // Container(
              //   height: 900,
              //   child: ListView.builder(
              //     physics: NeverScrollableScrollPhysics(),
              //     itemCount: 10,
              //     itemBuilder: (context,index){
              //       return Container(
              //         margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
              //         child: Row(
              //           children: 
              //             [
              //               Container(
              //                 height: 120,
              //                 width: 120,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   color: Colors.white38,
              //                   image: DecorationImage(
              //                     fit: BoxFit.cover,
              //                     image: AssetImage('assets/image/heater.jpg'),),
              //                 ),
              //               ),
              //               Expanded(
              //                 child: Container(
              //                   height: 100,
              //                   decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
              //                     color: Colors.white,
              //                   ),
              //                   child: Padding(
              //                     padding: EdgeInsets.only(left: 10,right: 10,top: 10),
              //                     child: Column(
              //                       crossAxisAlignment: CrossAxisAlignment.start,
              //                       children: [
              //                         BigText(text: "Best Water Heater In The Town",color: Colors.black,),
              //                         SizedBox(height: 5,),
              //                         SmallText(text: "This is the best water heater in the town and probably whole country",color: Colors.black26,),
              //                         SizedBox(height: 10,),
              //                         Row(
              //               children: [
              //                 Wrap(
              //                   children: 
              //                     List.generate(5, (index) => Icon(Icons.star_border_outlined,color: Colors.pink,size: 15,),),
              //                 ),
              //                  SizedBox(width: 10,),
              //                  SmallText(text: "4.5",color: Colors.black38,),
              //                  SizedBox(width: 20,),
              //                  SmallText(text: "1287",color: Colors.black38,),
              //                  SizedBox(width: 5,),
              //                  SmallText(text: "comments",color: Colors.black38,),
              //               ],
              //             ),
              //                       ],
              //                     ),
              //                   ),
              //                 ),
              //               ),
                       
              //           ],
              //         ),
              //       );
              //   }),
              // ),
          ],
        ),
      ),
    );
  }
  Widget _buildPageItem(int index){

    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index == _currPageValue.floor()-1){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1,currScale,1);
      matrix = Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: 
          [
            Container(
            height: 220,
            margin: EdgeInsets.only(left: 5,right: 5,bottom: 5,top: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 129, 127, 127),
                      offset: Offset(0,5),
                      blurRadius: 5.0,
                    ),
                     BoxShadow(
                      color: Color.fromARGB(255, 129, 127, 127),
                      offset: Offset(0,-1),
                      blurRadius: 5.0,
                    ),
                  ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  index.isEven?'assets/image/home.jpg' : 'assets/image/home2.jpg',
                  ),
                  ),
            ),
          ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Container(
            //     height: 130,
            //     margin: EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 15),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30),
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Color(0xFFF9e9e9),
            //           offset: Offset(0,5),
            //           blurRadius: 5.0,
            //         ),
            //       ],
            //     ),
            //     child: Container(
            //       margin: EdgeInsets.only(top: 14,left: 15,right: 15),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           BigText(text: "Black Forest",color: Colors.black),
            //           SizedBox(height: 10,),
            //           Row(
            //             children: [
            //               Wrap(
            //                 children: 
            //                   List.generate(5, (index) => Icon(Icons.star_border_outlined,color: Colors.pink,size: 15,),),
            //               ),
            //                SizedBox(width: 10,),
            //                SmallText(text: "4.5",color: Colors.black38,),
            //                SizedBox(width: 20,),
            //                SmallText(text: "1287",color: Colors.black38,),
            //                SizedBox(width: 5,),
            //                SmallText(text: "comments",color: Colors.black38,),
            //             ],
            //           ),
            //           SizedBox(height: 20,),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               IconAndTextWidget(icon: Icons.circle_sharp, iconcolor: AppColors.iconColor1, text: "Normal"),
            //               IconAndTextWidget(icon: Icons.location_on, iconcolor: Colors.pink.shade400, text: "1.7km"),
            //               IconAndTextWidget(icon: Icons.access_time_rounded, iconcolor: AppColors.iconColor2, text: "32min"),
            //             ],
            //             )
            //         ],
            //       ),
            //     ),
            //   ),
            //   ),
        ],
      ),
    );
  }
}