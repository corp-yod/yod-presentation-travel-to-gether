import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_navigator/yod_navigator.dart';

class CommonTabcontroller extends TabcontrollerInterface {
  static final CommonTabcontroller _instance = CommonTabcontroller._internal();

  CommonTabcontroller._internal();

  factory CommonTabcontroller() {
    return _instance;
  }

  @override
  getIndex(NavBarName navBarName) {
    switch (navBarName) {
      case NavBarName.HOME:
        return 0;
      case NavBarName.SEARCH:
        return 1;
      case NavBarName.PROFILE:
        return 2;
      default:
        return -1;
    }
  }
}
