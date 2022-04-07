import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Row(children: [
          Text("About Us"),]),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 20),
            child: Column(
              children: [
                Text("We do not make any representation or warranty as to specifics (such as quality, value, saleability, etc) of the products or services listed to be sold on the Site when products or services are sold by third parties. We do not implicitly or explicitly support or endorse the sale or purchase of any products or services on the Site. We accept no liability for any errors or omissions, whether on behalf of itself or third parties. We are not responsible for any non-performance or breach of any contract entered into between you and the sellers. We cannot and do not guarantee your actions or those of the sellers as they conclude transactions on the Site. We are not required to mediate or resolve any dispute or disagreement arising from transactions occurring on our Site. We do not at any point of time during any transaction as entered into by you with a third party on our Site, gain title to or have any rights or claims over the products or services offered by a seller. Therefore, we do not have any obligations or liabilities in respect of such contract(s) entered into between you and the seller(s). We are not responsible for unsatisfactory or delayed performance of services or damages or delays as a result of products which are out of stock, unavailable or back ordered. Pricing on any product(s) or related information as reflected on the Site may due to some technical issue, typographical error or other reason by incorrect as published and as a result you accept that in such conditions the seller or the Site may cancel your order without prior notice or any liability arising as a result. Any prepayments made for such orders will be refunded to you per our refund policy as stipulated."),
              ],
            ),
          )
        ],
      ),
    );
  }
}