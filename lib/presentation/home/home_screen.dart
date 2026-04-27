import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common_interface/common_tabbar_interface.dart';
import 'package:yod_presentation_travel_to_gether/route_name.dart';

class HomeScreen extends CommonTabbarInterface {
  @override
  Widget buildTabBar(BuildContext context) {
    return Tab(text: 'Home', icon: Icon(Icons.home));
  }

  @override
  Widget buildTabBarView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding10),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travel Together',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          'ค้นหาเพื่อนร่วมเดินทาง สร้างประสบการณ์ใหม่ๆ ไปด้วยกัน',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: kPadding6),
                  // RamButton(label: 'เริ่มต้น', onPressed: null),
                  RamButton(
                    label: 'สร้างทริป',
                    onPressed: () async {
                      print('Create Trip Button Pressed');
                      // YodNavigator().pushNamed(
                      //   context,
                      //   RouteNameTravel.travelLoginScreen,
                      //   arguments: {
                      //     'from': 'HomeScreen',
                      //   }
                      // );
                      // final isLogin = isLoggedIn();
                      // print('#->>> isTokenExpired isLogin $isLogin');

                      YodNavigator().tabAnimateTo(
                        context,
                        NavBarName.SEARCH,
                        controllerApp: CONTROLLERAPP.TRAVELAPP,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: kPadding7),

              RamButton(
                label: 'Go to Booking Screen',
                onPressed: () async {
                  print('Get Data');
                  final data = await loadBodyJson();
                  // print('#->>> Loaded JSON Data: ${data}');
                  YodNavigator().pushNamed(
                    context,
                    RouteNameTravel.bookingScreen,
                    arguments: {'bodyJson': data},
                  );
                },
              ),

              SizedBox(height: kPadding7),

              RamButton(
                label: 'Go to Search Tab',
                style: RamButtonStyle.outlined,
                onPressed: () {
                  print('#->>> Go to Search Tab Pressed');

                  YodNavigator().tabAnimateTo(
                    context,
                    NavBarName.SEARCH,
                    controllerApp: CONTROLLERAPP.TRAVELAPP,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<Map<String, dynamic>> loadBodyJson() async {
    final raw = await rootBundle.loadString(
      'packages/yod_presentation_travel_to_gether/assets/jsons/body.json',
    );
    return jsonDecode(raw) as Map<String, dynamic>;
  }
}
