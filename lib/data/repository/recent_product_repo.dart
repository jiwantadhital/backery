import 'package:backery/data/api/api_client.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:get/get.dart';


class RecentProductRepo extends GetxService{
  final ApiClient apiClient;
  RecentProductRepo({required this.apiClient});


  Future<Response> getrecentProductList()async{
    return await apiClient.getData(AppConstants.RECENT_URI);
  }
}