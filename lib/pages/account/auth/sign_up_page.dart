import 'package:backery/base/custom_loader.dart';
import 'package:backery/base/show_custom_snackbar.dart';
import 'package:backery/controllers/auth_controller.dart';
import 'package:backery/pages/account/auth/sign_in_page.dart';
import 'package:backery/widgets/add_text_field.dart';
import 'package:backery/widgets/big_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/signup_body_model.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var nameController=TextEditingController();
    var passwordController=TextEditingController();
    var phoneController=TextEditingController();
    var confirmpasswordController=TextEditingController();
    var signUpImages=[
      "f.png",
      "g.png"
    ];
    void _registration(){
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmpassword = confirmpasswordController.text.trim();
      String phone = phoneController.text.trim();

      if(email.isEmpty){
        showCustomSnackbar("Email must not be empty",title: "Email Address");
      }
      else if(!GetUtils.isEmail(email)){
        showCustomSnackbar("Email must be valid",title: "Email");
      }
      else if(name.isEmpty){
        showCustomSnackbar("Name must not be empty",title: "Name");
      }else if(password.isEmpty){
        showCustomSnackbar("Password must not be empty",title: "Password");
      }
      else if(password.length<6){
        showCustomSnackbar("Password lenth must be above 6",title: "Password");
      }else if(phone.isEmpty){
        showCustomSnackbar("Phone Number must not be empty",title: "Phone Number");
      }else if(confirmpassword.isEmpty){
        showCustomSnackbar("Confirm Password must not be empty",title: "Confirm password");
      }
      else{
      showCustomSnackbar("Yay",title: "Successful");
      SignUpBody signUpBody = SignUpBody(email: email, name: name, password: password, phone: phone,confirmpassword: confirmpassword);
      print(signUpBody.toString());
      authController.registration(signUpBody).then((status){
        if(status.isSuccess){
          print(status.isSuccess);
        }
        else{
          print("eror");
          showCustomSnackbar(status.message);
      }});
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return !_authController.isLoading?SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.only(top: 20,bottom: 10),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/image/gtech.png",
                  ),
                ),
              ),
            ),
            AppTextField(textController: emailController, hintText: "Email",icon: Icons.email,),
            SizedBox(height: 20,),
            AppTextField(textController: nameController, hintText: "Name",icon: Icons.person),
            SizedBox(height: 20,),
            AppTextField(textController: phoneController, hintText: "Phone",icon: Icons.phone,),
            SizedBox(height: 20,),
            AppTextField(textController: passwordController, hintText: "password",icon: Icons.password,),
            SizedBox(height: 20,),
            AppTextField(textController: confirmpasswordController, hintText: " confirm password",icon: Icons.password,),
            SizedBox(height: 40,),
            Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orange.withOpacity(0.8),
              ),
              child: Center(child: GestureDetector(
                onTap: (){
                  _registration();
                },
                child: BigText(text: "Sign Up",color: Colors.white,size: 30,)),),
            ),
            SizedBox(height: 40,),
            RichText(text: TextSpan(text: "Already Have Account? ",
            style: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontSize: 20,
            ),
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignInPage()),
                text: "Log in",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                )
              )
            ]
            ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(text: TextSpan(
              text: "Use one of the following methods",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )
            ),
            ),
            SizedBox(height: 10,),
            Wrap(
              children: 
                List.generate(2, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/image/"+signUpImages[index],
                    ),
                  ),
                ),),
            )
          ],
        ),
      ):CustomLoader();
      },)
    );
  }
}