import 'package:backery/controllers/auth_controller.dart';
import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/controllers/user_controller.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/widgets/account_widget.dart';
import 'package:backery/widgets/app_icon.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.withOpacity(0.8),
        title: Center(child: BigText(text: "Profile",color: Colors.white,size: 24,),),
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn?Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              AppIcon(icon: Icons.person,iconColor: Colors.white,backgroundColor: Colors.orange.withOpacity(0.8),
              size: 150,iconSize: 75,
              ),
              //name
              SizedBox(height: 10,),
              AccountWidget(appIcon: AppIcon(icon: Icons.person,backgroundColor: Colors.orange.withOpacity(0.8),iconColor: Colors.white,size: 50,iconSize: 25,), bigText: BigText(text: userController.userModel.firstName.toString(),color: Colors.black,),),
              //email
              SizedBox(height: 10,),
              AccountWidget(appIcon: AppIcon(icon: Icons.email,backgroundColor: Colors.orange.withOpacity(0.8),iconColor: Colors.white,size: 50,iconSize: 25,), bigText: BigText(text: userController.userModel.email.toString(),color: Colors.black,),),
              //phone
              SizedBox(height: 10,),
              AccountWidget(appIcon: AppIcon(icon: Icons.phone,backgroundColor: Colors.orange.withOpacity(0.8),iconColor: Colors.white,size: 50,iconSize: 25,), bigText: BigText(text: userController.userModel.phone.toString(),color: Colors.black,),),
              //address
              SizedBox(height: 10,),
              AccountWidget(appIcon: AppIcon(icon: Icons.location_city,backgroundColor: Colors.orange.withOpacity(0.8),iconColor: Colors.white,size: 50,iconSize: 25,), bigText: BigText(text: "Milan Chowk, Kathmandu",color: Colors.black,),),
              //message
              SizedBox(height: 10,),
              AccountWidget(appIcon: AppIcon(icon: Icons.message,backgroundColor: Colors.orange.withOpacity(0.8),iconColor: Colors.white,size: 50,iconSize: 25,), bigText: BigText(text: "Message",color: Colors.black,),),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  if(Get.find<AuthController>().userLoggedIn()){
                    Get.find<AuthController>().clearSharedData();
                    Get.offNamed(RouteHelper.signIn);
                    Get.find<CartController>().clear();
                    Get.find<CartController>().clearCartHistory();
                  }
                },
                child: AccountWidget(appIcon: AppIcon(icon: Icons.logout,backgroundColor: Colors.orange.withOpacity(0.8),iconColor: Colors.white,size: 50,iconSize: 25,), bigText: BigText(text: "LogOut",color: Colors.black,),)),
            ],
          ),
        ),
      ):Container(child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
            [
              Container(
              width: double.maxFinite,
              height: 170,
              margin: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(image: AssetImage(
                  "assets/image/signintocontinue.png",
                ),
                fit: BoxFit.cover
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.toNamed(RouteHelper.getSignIn());
              },
              child: Container(
                width: double.maxFinite,
                height: 100,
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange.withOpacity(0.8),
                ),
                child: Center(child: BigText(text: "Sign In",color: Colors.white,)),
              ),
            ),
          ],
        ),
      ),);
      },)
    );
  }
}