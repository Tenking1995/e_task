import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> item;
  final Function(int)? onTap;
  int currentIndex;
  Color? backgroundColor;
  Color? selectedItemColor;
  Color? unselectedItemColor;
  Color? indicator;

  CustomBottomNavigationBar({
    Key? key,
    required this.item,
    this.onTap,
    this.currentIndex = 0,
    this.backgroundColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.indicator = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: backgroundColor,
          child: BottomNavigationBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: selectedItemColor,
            selectedFontSize: 10,
            unselectedItemColor: unselectedItemColor,
            unselectedFontSize: 10,
            items: item,
            currentIndex: currentIndex,
            onTap: (index) => onTap != null ? onTap!(index) : null,
          ),
        ),
        Positioned(
          bottom: 0,
          left: currentIndex * (MediaQuery.of(context).size.width / item.length),
          child: Container(
            height: 2,
            color: indicator,
            width: MediaQuery.of(context).size.width * (1 / item.length),
          ),
        ),
      ],
    );
  }
}
