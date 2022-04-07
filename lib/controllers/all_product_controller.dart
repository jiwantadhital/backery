import 'dart:convert';

import 'package:backery/controllers/cart_controllers.dart';
import 'package:backery/data/repository/all_product_repo.dart';
import 'package:backery/models/all_model.dart';
import 'package:backery/models/cart_model.dart';
import 'package:backery/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllProductController extends GetxController{

  final AllProductRepo allProductRepo;
  AllProductController({required this.allProductRepo});

  List<AllModel> _allProductList=[];
  List<AllModel> get allProductList => _allProductList;
    late CartController _cart;
   bool _isloaded = false;
  bool get isLoaded => _isloaded;
    int _quantity =0;
    int get quantity=>_quantity;
int _inCartItems=0;
  int get inCartItems => _inCartItems+_quantity;

  Future<void> getallProductList()async{
    Response response = await allProductRepo.getallProductList();
    if(response.statusCode==200){ 
      print("yess products");
      _allProductList=[];
      _allProductList.addAll(List<AllModel>.from(jsonDecode(response.bodyString.toString()).map((x) => AllModel.fromJson(x))));
      _isloaded=true;
      update();
    }
    else{
        print("object");
    }
  }
  
 void setQuantity(bool isIncreament){
  if(isIncreament){
    _quantity = checkQuantity(_quantity+1) ;
  }
  else{
    _quantity = checkQuantity(_quantity-1);
  }
  update();
}
int checkQuantity(int quantity){
  if((_inCartItems+quantity)<0){
    Get.snackbar("Item Count", "You cannot reduce more",backgroundColor: Colors.deepOrangeAccent,colorText: Colors.white);
    if(_inCartItems>0){
      _quantity=-_inCartItems;
      return _quantity;
    }
    return 0;
  }
  else if((_inCartItems+quantity)>20){
    Get.snackbar("Item Count", "You cannot add more",backgroundColor: Colors.deepOrangeAccent,colorText: Colors.white);
    return 20;
  }
  else{
    return quantity;
  }
}
void initProduct(AllModel product, CartController cart){
  _quantity=0;
  _inCartItems=0;
  _cart = cart;
  var exist = false;
  exist = _cart.existInCart(product);
  if(exist){
    _inCartItems=_cart.getQuantity(product);
  }
}
void addItem(AllModel product){
_cart.addItem(product, _quantity);
_quantity=0;
_inCartItems=_cart.getQuantity(product);
_cart.items.forEach((key, value) { 
    print("The id is "+value.id.toString()+". The quantity is "+value.quantity.toString());
});
update();
}
int get totalItems{
  return _cart.totalItems;
}
List<CartModel> get getItems{
  return _cart.getItems;
}

}