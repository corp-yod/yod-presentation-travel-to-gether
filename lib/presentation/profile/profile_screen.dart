import 'package:flutter/material.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common_interface/common_tabbar_interface.dart';

class ProfileScreen extends CommonTabbarInterface {
  @override
  Widget buildTabBar(BuildContext context) {
    return Tab(text: 'โปรไฟล์', icon: Icon(Icons.person));
  }

  @override
  Widget buildTabBarView(BuildContext context) {
    return Center(child: Text('Page A'));
  }
}
