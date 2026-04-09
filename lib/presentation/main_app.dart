import 'package:flutter/material.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common_interface/common_tabbar_interface.dart';
import 'package:yod_presentation_travel_to_gether/presentation/home/home_screen.dart';
import 'package:yod_presentation_travel_to_gether/presentation/profile/profile_screen.dart';
import 'package:yod_presentation_travel_to_gether/presentation/search/search_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late TabController controller;

  List<CommonTabbarInterface> tabBars = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabBars.length, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return DashboardScreen();
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: RamTitleText(
            text: 'Travel Together',
            colorText: context.ramTheme.onPrimary,
          ),
          leading: const Icon(Icons.home),
        ),
        body: TabBarView(
          controller: controller,
          children: tabBars.map((e) => e.buildTabBarView(context)).toList(),
        ),
        bottomNavigationBar: Container(
          height: 100,
          padding: const EdgeInsets.all(kPadding7),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Colors.teal.withOpacity(0.3),
              child: TabBar(
                controller: controller,
                // indicatorColor: Colors.yellow,
                labelColor: Colors.white.withOpacity(0.9),
                unselectedLabelColor: Colors.blueGrey,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                dividerHeight: 0,
                onHover: (value, index) {
                  print('Hover on tab $index: $value');
                },
                onTap: (value) {
                  print('Tapped on tab $value');
                },
                tabs: tabBars.map((e) => e.buildTabBar(context)).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
