import 'package:backery/data/api/api_client.dart';
import 'package:backery/models/signup_body_model.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient,required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody)async{
    return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }
    bool userLoggedIn(){
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }
    Future<String> getUserToken()async{
    return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
  }
  
   Future<Response> login(String email, String password)async{
    return await apiClient.postData(AppConstants.LOGIN_URI, {"email":email,"password":password});
  }
  Future<bool>saveUserToken(String token)async{
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
  Future<void>saveUserEmailAndPassword(String email,String password)async{
  try{
    await sharedPreferences.setString(AppConstants.EMAIL, email);
    await sharedPreferences.setString(AppConstants.PASSWORD, password);
  }
  catch(e){
    throw e;
  }
  }
  bool clearSharedData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.EMAIL);
    sharedPreferences.remove(AppConstants.PASSWORD);
    apiClient.token="";
    apiClient.updateHeader("");
    return true;
  }
}