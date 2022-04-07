import 'package:backery/data/repository/cart_repo.dart';
import 'package:backery/models/all_model.dart';
import 'package:backery/models/cart_model.dart';
import 'package:backery/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int,CartModel>get items=>_items;
  List<CartModel> storageItems=[];

  void addItem(AllModel product,int quantity){
    var totalQuantity=0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value){
              totalQuantity=value.quantity!+quantity;
        return CartModel(
      id: product.id,
      name: product.name,
      quantity: value.quantity!+quantity,
      price: int.parse(product.discountPrice!) ,
      img: product.thumbnail,
      isExist: true,
      time: DateTime.now().toString(),
      product: product,
    );
      });
      if(totalQuantity<=0){
        _items.remove(product.id);
      }
    }else{
 if(quantity>0){
   _items.putIfAbsent(product.id!, () {
      return CartModel(
      id: product.id,
      name: product.name,
      quantity: quantity,
      price: int.parse(product.discountPrice!),
      img: product.thumbnail,
      isExist: true,
      time: DateTime.now().toString(),
      product: product,
    );
    });
 }
 else{
     Get.snackbar("Item Count ", "You should add at least 1 item to the cart",backgroundColor: Colors.deepOrangeAccent,colorText: Colors.white);
 }
    }
    cartRepo.addToCartList(getItems);
    update();
   
  }
  bool existInCart(AllModel product){
    if(_items.containsKey(product.id)){
      return true;
    }
    return false;
  }
  int getQuantity(AllModel product){
    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) { 
        if(key==product.id){
          quantity=value.quantity!;
        }
      });
    }
    return quantity;
  }
  int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) { 
      totalQuantity+=value.quantity!;
    });
    return totalQuantity;
  }
  List<CartModel> get getItems{
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }
  int get totalAmount{
    var total=0;
    _items.forEach((key, value) { 
      total+=value.quantity!*value.price!;
    });
    return total;
  }
  List<CartModel> getCartData(){
    setCart = cartRepo.getCartList();
    return storageItems;
  }
  set setCart(List<CartModel> items){
    storageItems=items;

    for(int i=0;i<storageItems.length;i++){
      _items.putIfAbsent(storageItems[i].product!.id!, () => storageItems[i]);
    }
  }
  void addToHistory(){
    cartRepo.addToCartHistoryList();
    clear();
  }
  void clearCartHistory(){
    cartRepo.clearCartHistory();
    update();
  }
  void clear(){
    _items={};
    update();
  }
  List<CartModel>getCartHistoryList(){
    return cartRepo.getCartHistoryList();
  }
}