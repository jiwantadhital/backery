import 'package:backery/data/api/api_client.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:get/get.dart';


class AllProductRepo extends GetxService{
  final ApiClient apiClient;
  AllProductRepo({required this.apiClient});


  Future<Response> getallProductList()async{
    return await apiClient.getData(AppConstants.ALL_URI);
  }
}