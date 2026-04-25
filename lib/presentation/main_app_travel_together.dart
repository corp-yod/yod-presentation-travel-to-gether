import 'package:flutter/material.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/app_tab_navigator.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/presentation/auth_guard.dart/auth_gurad.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common/common_tabcontroller.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common/common_tabcontroller1.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common_interface/common_tabbar_interface.dart';
import 'package:yod_presentation_travel_to_gether/presentation/home/home_screen.dart';
import 'package:yod_presentation_travel_to_gether/presentation/profile/profile_screen.dart';
import 'package:yod_presentation_travel_to_gether/presentation/search/search_screen.dart';
import 'package:yod_presentation_travel_to_gether/presentation/widget/bottom_nav.dart';

class MainAppTravelToGether extends StatefulWidget {
  const MainAppTravelToGether({super.key});

  @override
  State<MainAppTravelToGether> createState() => _MainAppTravelToGetherState();
}

class _MainAppTravelToGetherState extends State<MainAppTravelToGether>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  List<CommonTabbarInterface> tabBars = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    print(
      '#->>> CommonTabcontroller1 getCurrent ${CommonTabcontroller1().getCurrent()}',
    );
    initialCommonTabcontroller();
    // controller = TabController(length: tabBars.length, vsync: this);
    controller = CommonTabcontroller1().getTabcontroller;
  }

  Future<void> initialCommonTabcontroller() async {
    CommonTabcontroller().initTabController(length: tabBars.length);
    YodNavigator().registerTabController(
      CommonTabcontroller(),
      // AppTabController(tabController: CommonTabcontroller().getTabcontroller),
      controllerApp: CONTROLLERAPP.MAINAPP,
    );

    CommonTabcontroller1().initTabController(length: tabBars.length);
    YodNavigator().registerTabController(
      // AppTabController(tabController: CommonTabcontroller1().getTabcontroller),
      CommonTabcontroller1(),
      controllerApp: CONTROLLERAPP.TRAVELAPP,
    );
  }

  @override
  void dispose() {
    print(
      '#->>> CommonTabcontroller1 dispose ${CommonTabcontroller1().getCurrent()}',
    );
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthGuard(child: _buildMainAppTravelToGether());
  }

  Widget _buildMainAppTravelToGether() {
    // String _currentTab = 'home';
    return SafeArea(
      top: false,
      bottom: true,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.teal,
        //   title: RamTitleText(
        //     text: 'Travel Together',
        //     colorText: context.ramTheme.onPrimary,
        //   ),
        //   leading: const Icon(Icons.home),
        // ),
        body: TabBarView(
          controller: controller,
          children: tabBars.map((e) => e.buildTabBarView(context)).toList(),
        ),
        //   bottomNavigationBar: BottomNav(
        //   activeTab: _currentTab,
        //   onTabChange: (tabId) {
        //     setState(() {
        //       _currentTab = tabId;
        //     });
        //   },
        // ),
        bottomNavigationBar: Container(
          height: 100,
          padding: const EdgeInsets.all(kPadding7),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Colors.teal.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      print('Tapped on Home Tab');
                      controller.animateTo(0);
                    },
                    child: Tab(text: 'บ้าน', icon: const Icon(Icons.home)),
                  ),
                  InkWell(
                    onTap: () {
                      print('Tapped on Search Tab');
                      controller.animateTo(1);
                    },
                    child: Tab(text: 'ค้นหา', icon: const Icon(Icons.search)),
                  ),
                  InkWell(
                    onTap: () {
                      print('Tapped on Profile Tab');
                      controller.animateTo(2);
                    },
                    child: Tab(text: 'โปรไฟล์', icon: const Icon(Icons.person)),
                  ),
                ],
              ),
              // TabBar(
              //   controller: controller,
              //   // indicatorColor: Colors.yellow,
              //   labelColor: Colors.white.withOpacity(0.9),
              //   unselectedLabelColor: Colors.blueGrey,
              //   indicator: const UnderlineTabIndicator(
              //     borderSide: BorderSide.none,
              //   ),
              //   dividerHeight: 0,
              //   onHover: (value, index) {
              //     print('Hover on tab $index: $value');
              //   },
              //   onTap: (value) {
              //     print('Tapped on tab $value');
              //   },
              //   // tabs: tabBars.map((e) => e.buildTabBar(context)).toList(),
              //   tabs: [

              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
