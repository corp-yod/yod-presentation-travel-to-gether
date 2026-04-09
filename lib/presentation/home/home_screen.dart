import 'package:flutter/material.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_presentation_travel_to_gether/presentation/common_interface/common_tabbar_interface.dart';

class HomeScreen extends CommonTabbarInterface {
  @override
  Widget buildTabBar(BuildContext context) {
    return Tab(text: 'บ้าน', icon: Icon(Icons.home));
  }

  @override
  Widget buildTabBarView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding7),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Text('Home Screen'),
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
                    onPressed: () {
                      print('Create Trip Button Pressed');
                      // YodNavigator().pushNamed(
                      //   context,
                      //   RouteNameTravel.travelLoginScreen,
                      //   arguments: {
                      //     'from': 'HomeScreen',
                      //   }
                      // );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
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
