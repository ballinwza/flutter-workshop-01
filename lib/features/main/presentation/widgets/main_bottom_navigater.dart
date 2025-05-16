import 'package:flutter/material.dart';

class MainBottomNavigator extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onTapEvent;

  const MainBottomNavigator(
      {super.key, required this.onTapEvent, required this.selectedIndex});

  @override
  State<MainBottomNavigator> createState() => _MainBottomNavigatorState();
}

class _MainBottomNavigatorState extends State<MainBottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: const Color(0xFFF8F7F7),
        selectedIconTheme:
            const IconThemeData(color: Color(0xFF6055D8), size: 24),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF9E9E9E),
        iconSize: 24,
        currentIndex: widget.selectedIndex,
        onTap: widget.onTapEvent,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_rounded,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_rounded,
              ),
              label: "Profile"),
        ]);
  }
}
