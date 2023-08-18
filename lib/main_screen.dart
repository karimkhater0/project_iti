import 'package:flutter/material.dart';
import 'package:project_iti/account_screen.dart';
import 'package:project_iti/categories_screen.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {




  List<String> title=['Home','Categories','Account'];
  List<Widget> screens =[
     const HomeScreen(),
    const CategoriesScreen(),
     const AccountScreen(),
  ];
  int currentIndex=0;


  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(title[currentIndex]),
        centerTitle: true,
      ),

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value)
        {
          setState(() {
            currentIndex=value;
          });
        },
        items:  const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
