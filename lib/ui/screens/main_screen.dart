import 'dart:io';
import 'package:dukan/constants/design_constants/colors_manager.dart';
import 'package:dukan/ui/screens/home_screen.dart';
import 'package:dukan/ui/screens/search_products_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndexScreen = 0;

  List<Widget> screens = [
    const HomeScreen(),
    Container(),
    const SearchProductsScreen(),
    // const FavoritesScreen(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    Future <bool> onBackPressed () async{
      return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:  const Text('Dukan', textAlign:TextAlign.center ,),
            content: const Text('Do you want to Exit?', textAlign:TextAlign.center ,),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () =>
                    Navigator.of(context).pop(false),
              ),
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    exit(0);
                  }
              ),
            ],
          ));
    }
    return WillPopScope(
      onWillPop: onBackPressed,
      child: Scaffold(
        body:screens[currentIndexScreen],
        bottomNavigationBar:bottomNavigationBarIcons() ,
      ),
    );
  }

  Widget bottomNavigationBarIcons() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(19.5), topLeft: Radius.circular(19.5)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
          ],
        ),
        child: BottomNavigationBar(

            type: BottomNavigationBarType.shifting,
            currentIndex: currentIndexScreen,
            selectedItemColor: ColorsManager.primaryColor,
            unselectedItemColor: ColorsManager.gray,
            onTap: (index) {
              setState(() {
                currentIndexScreen = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon:
                Icon(Icons.shopping_cart),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon:
                Icon(Icons.search),
                label: 'search',
              ),
              // BottomNavigationBarItem(
              //   icon:
              //   Icon(Icons.favorite),
              //   label: 'Favorite',
              // ),
              BottomNavigationBarItem(
                icon:
                Icon(Icons.person),
                label: 'Profile',
              ),

            ],
          ),
        );
  }

}