import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yod/yod.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common/common_tabcontroller1.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common_interface/common_tabbar_interface.dart';
import 'package:yod_presentation_travel_to_gether/route_name.dart';

class HomeScreen extends CommonTabbarInterface {
  @override
  Widget buildTabBar(BuildContext context) {
    return Tab(text: 'บ้าน', icon: Icon(Icons.home));
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
                  CreateTripButton(
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

              CreateTripButton(
                onPressed: () async {
                  print('Set Data');

                  print(
                    '#->>> CommonTabcontroller1 getCurrent ${CommonTabcontroller1().getCurrent()}',
                  );

                  // await YodData.instance
                  //     .variableStorage()
                  //     .setKeyValueString('setCustomerData', 'Tinnakorn')
                  //     .whenComplete(() {
                  //       print('Data set successfully');
                  //     })
                  //     .catchError((error) {
                  //       print('Error setting data: $error');
                  //     });

                  // await YodData.instance
                  //     .secureStorage()
                  //     .setKeyValue('secureStorage', 'Tinnakorn')
                  //     .whenComplete(() {
                  //       print('SecureStorage Data set successfully');
                  //     })
                  //     .catchError((error) {
                  //       print('Error setting SecureStorage data: $error');
                  //     });

                  // YodData.instance.memoryStorage().setKeyValue(
                  //   'memoryStorage',
                  //   'Tinnakorn',
                  // );
                },
              ),
              SizedBox(height: kPadding7),
              CreateTripButton(
                onPressed: () async {
                  print('Get Data');
                  // await YodData()
                  //     .variableStorage()
                  //     .getKeyValueString('setCustomerData')
                  //     .then((value) {
                  //       print('Retrieved Data: $value');
                  //     })
                  //     .catchError((error) {
                  //       print('Error retrieving data: $error');
                  //     });

                  // await YodData.instance
                  //     .secureStorage()
                  //     .getKeyValue('secureStorage')
                  //     .then((value) {
                  //       print('Retrieved SecureStorage Data: $value');
                  //     });

                  // final memoryStorageData = YodData.instance
                  //     .memoryStorage()
                  //     .getKeyValue('memoryStorage');
                  // print('Retrieved MemoryStorage Data: $memoryStorageData');

                  final data = await loadBodyJson();
                  // print('#->>> Loaded JSON Data: ${data}');
                  YodNavigator().pushNamed(
                    context,
                    RouteNameTravel.bookingScreen,
                    arguments: {'bodyJson': data},
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

class CreateTripButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateTripButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add, color: Colors.white, size: 18),
              SizedBox(width: 8),
              Text(
                'สร้างทริป',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
