import 'dart:convert';

import 'package:backery/data/repository/recent_product_repo.dart';
import 'package:backery/models/recent_product_model.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:get/get.dart';


class RecentProductController extends GetxController{

  final RecentProductRepo recentProductRepo;
  RecentProductController({required this.recentProductRepo});

  List<Recent> _recentProductList=[];
  List<Recent> get recentProductList => _recentProductList;
   bool _isloaded = false;
  bool get isLoaded => _isloaded;

  Future<void> getrecentProductList()async{
    Response response = await recentProductRepo.getrecentProductList();
    if(response.statusCode==200){
            print(AppConstants.TOKEN.toString());
      _recentProductList=[];
      _recentProductList.addAll(List<Recent>.from(jsonDecode(response.bodyString.toString()).map((x) => Recent.fromJson(x))));
      _isloaded=true;
      update();
    }
    else{
        print("object");
    }
  }

}