import 'package:flutter/material.dart';

abstract class CommonTabbarInterface {
  Widget buildTabBar(BuildContext context);
  Widget buildTabBarView(BuildContext context);

  // void onTabTapped(int index) {
  //   print('Tapped on tab $index');
  // }

  // void onTabHover(bool isHovering, int index) {
  //   print('Hover on tab $index: $isHovering');
  // }

  // void onTabChanged(int index) {
  //   print('Tab changed to $index');
  // }

  // Widget buildTabBar(List<Widget> tabs, TabController controller) {
  //   return TabBar(
  //     controller: controller,
  //     labelColor: Colors.white.withOpacity(0.9),
  //     unselectedLabelColor: Colors.blueGrey,
  //     indicator: const UnderlineTabIndicator(borderSide: BorderSide.none),
  //     dividerHeight: 0,
  //     onHover: onTabHover,
  //     onTap: onTabTapped,
  //     tabs: tabs,
  //   );
  // }

  // Widget buildTabBarView(List<Widget> tabBarView, TabController controller) {
  //   return TabBarView(controller: controller, children: tabBarView);
  // }
}
