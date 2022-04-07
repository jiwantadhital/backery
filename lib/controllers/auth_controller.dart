import 'package:backery/data/repository/auth_repo.dart';
import 'package:backery/models/response_model.dart';
import 'package:backery/models/signup_body_model.dart';
import 'package:backery/utils/app_constants.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading=false;
  bool get isLoading => _isLoading;
 Future<ResponseModel> registration(SignUpBody signUpBody)async{
    _isLoading = true;
    update();
      Response response= await authRepo.registration(signUpBody);
      late ResponseModel responseModel;
      if(response.statusCode==200){
        authRepo.saveUserToken(response.body["token"]);
        responseModel = ResponseModel(true, response.body["token"]);
      }
      else{
        responseModel = ResponseModel(false, response.statusText!);
      }
      _isLoading =false;
      update();
      return responseModel;
  }
   Future<ResponseModel> login(String email, String password)async{
        print("Getting token");
    _isLoading = true;
    update();
      Response response= await authRepo.login(email,password);
      late ResponseModel responseModel;
      if(response.statusCode==200){
          print(response.body.toString());
        authRepo.saveUserToken(response.body['token']);
        responseModel = ResponseModel(true, response.body['token']);
      }
      else{
        responseModel = ResponseModel(false, response.statusText!);
      }
      _isLoading =false;
      update();
      return responseModel;
  }
  void saveUserEmailAndPassword(String email, String password){
    authRepo.saveUserEmailAndPassword(email, password);
  }
  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }
  bool clearSharedData(){
    return authRepo.clearSharedData();
  }
}