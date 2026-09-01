import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plant_app_1/const/constants.dart';
import 'package:plant_app_1/screens/card_page.dart';
import 'package:plant_app_1/screens/favorite_page.dart';
import 'package:plant_app_1/screens/home_page.dart';
import 'package:plant_app_1/screens/profile_page.dart';
import 'package:plant_app_1/screens/scan_page.dart';

///==================================
///this page is for const app bar and const nav
///==================================
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;

  List<Widget> page = const [
    HomePage(),
    FavoritePage(),
    CardPage(),
    ProfilePage(),
  ];

  List<IconData> iconList = const [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];

  List<String> appBarTitle = const [
    'خانه',
    'علاقه‌مندی‌ها',
    'سبد‌خرید',
    'پروفایل',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.notifications, color: Constants.blackColor, size: 30),
              Text(
                appBarTitle[bottomIndex],
                style: TextStyle(
                  fontFamily: 'Vazirmatn',
                  fontWeight: FontWeight.w700,
                  color: Constants.blackColor,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(index: bottomIndex, children: page),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.fade,
            ),
          );
        },
        backgroundColor: Constants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
        child: Image.asset('assets/images/code-scan-two.png', height: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        activeIndex: bottomIndex,
        inactiveColor: Colors.black.withValues(alpha: 0.5),
        gapLocation: GapLocation.center,
        icons: iconList,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottomIndex = index;
          });
        },
      ),
    );
  }
}
