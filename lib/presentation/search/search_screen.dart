import 'package:flutter/material.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common_interface/common_tabbar_interface.dart';

class SearchScreen extends CommonTabbarInterface {
  @override
  Widget buildTabBar(BuildContext context) {
    return Tab(text: 'ค้นหา', icon: Icon(Icons.search));
  }

  @override
  Widget buildTabBarView(BuildContext context) {
    return Center(child: Text('Page C'));
  }
}
