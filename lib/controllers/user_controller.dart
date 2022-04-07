import 'package:backery/data/repository/user_repository.dart';
import 'package:backery/models/response_model.dart';
import 'package:backery/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';

class UserController extends GetxController implements GetxService{
  final UserRepo userRepo;
  UserController({required this.userRepo});
  bool _isLoading=false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel=> _userModel;

 Future<ResponseModel> getUserInfo()async{
      Response response= await userRepo.getUserInfo();
      late ResponseModel responseModel;
      print(response.body);
      if(response.statusCode==200){
        print("hahahhaha");
        _userModel = UserModel.fromJson(response.body);
        update();
        responseModel = ResponseModel(true, "success");
      }
      else{
        responseModel = ResponseModel(false, response.statusText!);
      }
      _isLoading =false;
      update();
      return responseModel;
  }
  
}