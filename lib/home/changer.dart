import 'package:backery/home/popular_products.dart';
import 'package:backery/products/offer_products.dart';
import 'package:backery/products/recent_products.dart';
import 'package:backery/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Changer extends StatefulWidget {
  const Changer({ Key? key }) : super(key: key);

  @override
  State<Changer> createState() => _ChangerState();
}

class _ChangerState extends State<Changer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Material(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: Colors.black.withOpacity(.2),
          ),
        ),
        child: Column(
          children: 
            [
              Container(
                // decoration: BoxDecoration(
                //   border: Border.all(
                //     color: Colors.black12),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black12,
                //       blurRadius: 5.0,
                //       offset: Offset(0, 5)
                //     )
                //   ]
                // ),
                child: TabBar(
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  color: Colors.orange,
                ),
                tabs: [
                Tab(text: "Popular",),
                Tab(text: "Brands",),
                // Tab(text: "Discount",),
                          ],
                          ),
              ),
            Container(
              color:AppColors.kSilver,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(children: [
                Container(
                  child: PopularProducts(),
                )
                ,Container(
                  child: RecentProduts(),
                )
                // ,Container(
                //   child: OfferProducts(),
                //   )
                ]
                ),
            )
          ],
        ),
        
      ),
    );
  }
}