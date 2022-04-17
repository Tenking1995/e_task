import 'package:flutter/services.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/plant_list_screen.dart';
import 'package:flutter/material.dart';

import '../common/app_color.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentIndex = 0;
  final List<BottomNavigationBarItem> _bottomNavItems = [
    BottomNavigationBarItem(
      icon: getPaddingAssetIcon('assets/images/nav_icon_home.png'),
      activeIcon: getPaddingAssetIcon('assets/images/nav_icon_home_green.png'),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: getPaddingAssetIcon('assets/images/nav_icon_mall.png'),
      activeIcon: getPaddingAssetIcon('assets/images/nav_icon_mall_green.png'),
      label: 'MALL',
    ),
    BottomNavigationBarItem(
      icon: getPaddingAssetIcon('assets/images/nav_icon_discover.png'),
      label: 'DISCOVER',
    ),
    BottomNavigationBarItem(
      icon: getPaddingAssetIcon('assets/images/nav_icon_inbox.png'),
      label: 'INBOX',
    ),
    BottomNavigationBarItem(
      icon: getPaddingAssetIcon('assets/images/nav_icon_account.png'),
      label: 'ACCOUNT',
    ),
  ];
  late List<Widget> _bottomNavPages;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColor.primary,
      ),
    );
    _bottomNavPages = [
      const HomeScreen(),
      PlantListScreen(changePage: _changeTab),
      const Center(child: Text('Discover Page')),
      const Center(child: Text('Inbox Page')),
      const Center(child: Text('Account Page')),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _bottomNavPages),
      bottomNavigationBar: Container(
        // * Top shadow
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400]!,
              blurRadius: 5,
            ),
          ],
        ),
        child: CustomBottomNavigationBar(
          item: _bottomNavItems,
          onTap: (index) => _changeTab(index),
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.primary,
          indicator: AppColor.primary,
        ),
      ),
    );
  }

  // * =================================================================
  // * Widgets
  // * =================================================================

  static Widget getPaddingAssetIcon(String assetImagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Image.asset(
        assetImagePath,
        height: 25,
        width: 25,
      ),
    );
  }

  // * Bottom Navigation Bar with bottom indicator line
  Widget getCustomBottomNavigationBar() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.white,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.primary,
            selectedFontSize: 10,
            unselectedItemColor: Colors.grey,
            unselectedFontSize: 10,
            items: _bottomNavItems,
            currentIndex: _currentIndex, //New
            onTap: (index) => _changeTab(index),
          ),
        ),
        // * Custom bottom indicator line
        Positioned(
          bottom: 0,
          left: _currentIndex * (MediaQuery.of(context).size.width / _bottomNavItems.length),
          child: Container(
            height: 2,
            color: AppColor.primary,
            width: MediaQuery.of(context).size.width * (1 / _bottomNavItems.length),
          ),
        ),
      ],
    );
  }

  // * =================================================================
  // * Private Functions
  // * =================================================================

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light.copyWith(
            statusBarColor: AppColor.primary,
          ),
        );
      } else {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: AppColor.white,
          ),
        );
      }
    });
  }
}
