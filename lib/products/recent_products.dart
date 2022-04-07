import 'package:flutter/material.dart';

import '../widgets/big_text.dart';
import '../widgets/small_text.dart';

class RecentProduts extends StatefulWidget {
  const RecentProduts({ Key? key }) : super(key: key);

  @override
  State<RecentProduts> createState() => _RecentProdutsState();
}

class _RecentProdutsState extends State<RecentProduts> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.only(left: 20,right: 20,bottom: 10),
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
                      image: AssetImage('assets/image/rice.jpg'),),
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
                          BigText(text: "Best Rice-Cooker In The Town",color: Colors.black,),
                          SizedBox(height: 5,),
                          SmallText(text: "This is the rice cooker heater in the town and probably whole country",color: Colors.black26,),
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
        );
    });
  }
}