import 'package:backery/controllers/all_product_controller.dart';
import 'package:backery/controllers/auth_controller.dart';
import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/controllers/popular_product_controller.dart';
import 'package:backery/controllers/recent_product_controllers.dart';
import 'package:backery/controllers/user_controller.dart';
import 'package:backery/data/api/api_client.dart';
import 'package:backery/data/repository/all_product_repo.dart';
import 'package:backery/data/repository/auth_repo.dart';
import 'package:backery/data/repository/popular_products_repo.dart';
import 'package:backery/data/repository/recent_product_repo.dart';
import 'package:backery/data/repository/user_repository.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/cart_repo.dart';

Future <void> init()async{
  final sharedPreferences = await SharedPreferences.getInstance();
  //api client
Get.lazyPut(() => sharedPreferences);
Get.lazyPut(()=>ApiClient(appBaseUri: AppConstants.BASE_URL));
Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
Get.lazyPut(() => UserRepo(apiClient: Get.find()));
//repos
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
Get.lazyPut(() => RecentProductRepo(apiClient: Get.find()));
Get.lazyPut(() => AllProductRepo(apiClient: Get.find()));
Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

//controllers
// Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
Get.lazyPut(() => RecentProductController(recentProductRepo: Get.find()));
Get.lazyPut(() => AllProductController(allProductRepo: Get.find()));
Get.lazyPut(() => CartController(cartRepo: Get.find()));
Get.lazyPut(() => AuthController(authRepo: Get.find()));
Get.lazyPut(() => UserController(userRepo: Get.find()));
}

