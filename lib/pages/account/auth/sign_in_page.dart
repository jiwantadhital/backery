import 'package:backery/base/custom_loader.dart';
import 'package:backery/base/show_custom_snackbar.dart';
import 'package:backery/controllers/auth_controller.dart';
import 'package:backery/home/home_page.dart';
import 'package:backery/pages/account/auth/sign_up_page.dart';
import 'package:backery/routes/route_helper.dart';
import 'package:backery/widgets/add_text_field.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passwordController=TextEditingController();

        void _login(AuthController authController){
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if(email.isEmpty){
        showCustomSnackbar("Email must not be empty",title: "Email Address");
      }
      else if(!GetUtils.isEmail(email)){
        showCustomSnackbar("Email must be valid",title: "Email");
      }
     else if(password.isEmpty){
        showCustomSnackbar("Password must not be empty",title: "Password");
      }
      else if(password.length<6){
        showCustomSnackbar("Password lenth must be above 6",title: "Password");
      }
      else{
      authController.login(email,password).then((status){
        if(status.isSuccess){
          Get.toNamed(RouteHelper.getInitial());
        }
        else{
          print(status.message);
          showCustomSnackbar(status.message);
      }});
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (authController){
        return !authController.isLoading?SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 10),
              child: const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/image/gtech.png",
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Hello",style: TextStyle(
                    fontSize: 70,color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                   Text("Sign in to your account",style: TextStyle(
                    fontSize: 20,color: Colors.black26,
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            AppTextField(textController: emailController, hintText: "Phone or Email",icon: Icons.phone,),
            SizedBox(height: 20,),
            AppTextField(textController: passwordController, hintText: "password",icon: Icons.password,),
            SizedBox(height: 20,),
           Row(
             children: [
               Expanded(child: Container()),
                RichText(text: TextSpan(
              text: "Sign in to your account",style: TextStyle(color: Colors.black26,fontSize: 20)
            ),
            ),
            SizedBox(width: 20,),
             ],
           ),
            SizedBox(height: 60,),
            Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange.withOpacity(0.8),
              ),
              child: Center(child: GestureDetector(
                onTap: (){
                  _login(authController);
                },
                child: BigText(text: "Sign In",color: Colors.white,size: 30,)),),
            ),
            SizedBox(height: 40,),
            RichText(
              text: TextSpan(text: "Don't an Have Account? ",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 20,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage()),
                text: "Create",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                )
              )
            ]
            ),
            ),
          ],
        ),
      ):CustomLoader();
      },)
    );
  }
}