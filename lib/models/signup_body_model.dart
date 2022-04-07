class SignUpBody{

String name;
String phone;
String email;
String password;
String confirmpassword;
SignUpBody({required this.email,required this.name,required this.password,required this.phone,required this.confirmpassword});
Map<String, dynamic> toJson(){
  final Map<String, dynamic>data=new Map<String,dynamic>();
  data["first_name"] = this.name;
  data["phone"] = this.phone;
  data["email"] = this.email;
  data["password"] = this.password;
  data["password_confirmation"] = this.confirmpassword;
  return data;
}
}