class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  Null? photo;
  String? emailToken;
  Null? shipAddress1;
  Null? shipAddress2;
  Null? shipZip;
  Null? shipCity;
  Null? shipCountry;
  Null? shipCompany;
  Null? billAddress1;
  Null? billAddress2;
  Null? billZip;
  Null? billCity;
  Null? billCountry;
  Null? billCompany;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.photo,
      this.emailToken,
      this.shipAddress1,
      this.shipAddress2,
      this.shipZip,
      this.shipCity,
      this.shipCountry,
      this.shipCompany,
      this.billAddress1,
      this.billAddress2,
      this.billZip,
      this.billCity,
      this.billCountry,
      this.billCompany,
      this.createdAt,
      this.updatedAt});

   factory UserModel.fromJson(Map<String, dynamic> json) {
     return UserModel(
    id : json['id'],
    firstName : json['first_name'],
    lastName : json['last_name'],
    phone : json['phone'],
    email : json['email'],
    photo : json['photo'],
    emailToken : json['email_token'],
    shipAddress1 : json['ship_address1'],
    shipAddress2 : json['ship_address2'],
    shipZip : json['ship_zip'],
    shipCity : json['ship_city'],
    shipCountry : json['ship_country'],
    shipCompany : json['ship_company'],
    billAddress1 : json['bill_address1'],
    billAddress2 : json['bill_address2'],
    billZip : json['bill_zip'],
    billCity : json['bill_city'],
    billCountry : json['bill_country'],
    billCompany : json['bill_company'],
    createdAt : json['created_at'],
    updatedAt : json['updated_at']
    );
  }

 
}