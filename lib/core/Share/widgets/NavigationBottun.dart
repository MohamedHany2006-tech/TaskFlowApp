import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:to_do_list/core/style/ColorManager.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.NeutralWhite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: GNav(
          backgroundColor: ColorManager.NeutralWhite,
          activeColor: ColorManager.NeutralWhite,
          color: Colors.grey,
          tabBackgroundColor: ColorManager.BrandButton,
          gap: 6,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          selectedIndex: selectedIndex,
          onTabChange: onItemSelected,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.calendar_month,
              text: 'Calendar',
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
            ),
            GButton(
              icon: Icons.history,
              text: 'History',
            ),
          ],
        ),
      ),
    );
  }
}