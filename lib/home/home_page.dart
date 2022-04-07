import 'package:backery/home/main_food_page.dart';
import 'package:backery/pages/account/accountPage.dart';
import 'package:backery/pages/cart/cart_history.dart';
import 'package:backery/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex =0;
  List pages=[
    MainFoodPage(),
    Container(child: Center(child: Text("Next Page")),),
    CartHistory(),
    AccountPage(),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: AppColors.mainColor,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: "Home",
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: "Categories",
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_checkout),
          label: "Cart",
          ),
           BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
          ),
        ],
      ),
    );
  }
}

