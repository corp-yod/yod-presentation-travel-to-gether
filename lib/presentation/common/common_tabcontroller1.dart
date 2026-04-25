import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_navigator/yod_navigator.dart';

class CommonTabcontroller1 extends TabcontrollerInterface {
  static final CommonTabcontroller1 _instance =
      CommonTabcontroller1._internal();

  CommonTabcontroller1._internal();

  factory CommonTabcontroller1() {
    return _instance;
  }

  @override
  getIndex(NavBarName navBarName) {
    print('#->>> CommonTabcontroller1 getIndex ${navBarName.name}');
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
