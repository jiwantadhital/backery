import 'package:backery/home/home_page.dart';
import 'package:backery/pages/All/all_products.dart';
import 'package:backery/pages/All/all_products_details.dart';
import 'package:backery/pages/account/auth/sign_in_page.dart';
import 'package:backery/pages/cart/cart_page.dart';
import 'package:backery/pages/popular_product_detail.dart';
import 'package:backery/pages/splash/splash_page.dart';
import 'package:backery/pages/terms&about/about_us.dart';
import 'package:backery/pages/terms&about/terms_and_condition.dart';
import 'package:get/get.dart';

class RouteHelper{
  static const String splashPage="/splash-page";
  static const String initial = "/";
  static const String popularProduct="/popular_products";
  static const String cartPage = "/cart-page";
  static const String allProduct= "/all-product";
    static const String allProductDetails= "/all-product-details";
  static const String termsPage="/terms-page";
  static const String aboutUs="/about-us";
    static const String signIn="/signIn";


  static String getSplashPage()=>'$splashPage';
  static String getPopularProduct(int pageId)=>'$popularProduct?pageId=$pageId';
  static String getAllProductDetails(int pageId)=>'$allProductDetails?pageId=$pageId';
  static String getInitial()=>'$initial';
  static String getCartPage()=>'$cartPage';
  static String getAllProduct()=>'$allProduct';
  static String getTermsPage()=>'$termsPage';
  static String getAboutUs()=>'$aboutUs';
  static String getSignIn()=>'$signIn';

  static List<GetPage> routes=[

    GetPage(name: splashPage, page: (){
      return SplashScreen();
    }),

    GetPage(name: initial, page: (){
      return HomePage();
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: signIn, page: (){
      return SignInPage();
    },
    transition: Transition.fadeIn
    ),
    // GetPage(name: popularProduct, page: (){
    //   var pageId=Get.parameters['pageId'];
    //   return PopularProductDetails(pageId: int.parse(pageId!),);
    // }),
    GetPage(name: allProductDetails, page: (){
      var pageId=Get.parameters['pageId'];
      return AllProductDetails(pageId: int.parse(pageId!),);
    }),
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: allProduct, page: (){
      return AllProducts();
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: termsPage, page: (){
      return TermsAndCondition();
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: aboutUs, page: (){
      return AboutUs();
    },
    transition: Transition.fadeIn
    ),
  ];
}