import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';
import 'package:yod_navigator/presentation/yod_navigator/yod_navigator.dart';
import 'package:yod_presentation_travel_to_gether/presentation/home/widgets/html_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String? description;
  @override
  void initState() {
    super.initState();
    print('#->>> BookingScreen initState');
    // context.read<BookingScreenController>().loadBodyJson();
  }

  @override
  Future<void> didChangeDependencies() async {
    final args = await YodNavigator().getArguments(context);
    // ใช้ args ทำงานต่อ (อาจจะต้อง setState ถ้าจะให้หน้าจอเปลี่ยน)
    // print('#->>> BookingScreen getArguments: $args');

    final bodyJson = args?['bodyJson'] as Map<String, dynamic>?;

    // print('#->>> BookingScreen bodyJson: $bodyJson');

    final specCharacteristic = bodyJson?['specCharacteristic'];

    // print('#->>> BookingScreen specCharacteristic: ${specCharacteristic[0]}');

    final privacyTerms = specCharacteristic?[0]['privacyTerm'];

    final privacyTermRelationship = privacyTerms?[0]['privacyTermRelationship'];

    description = privacyTermRelationship?[0]['description'] as String?;

    // print('#->>> BookingScreen description: $description');

    setState(() {});

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ramThemeColors = context.ramThemeColors;

    return Scaffold(
      backgroundColor: ramThemeColors.bgBg,
      appBar: AppBar(title: const Text('Booking Screen')),
      body: Padding(
        padding: const EdgeInsets.all(kPadding7),
        child: Container(
          decoration: BoxDecoration(
            color: ramThemeColors.bgContainer,
            borderRadius: BorderRadius.circular(kRadius7),
            boxShadow: [
              BoxShadow(
                color: ramThemeColors.bgBorderContainer.withOpacity(1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kRadius7),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(kPadding7),
                        child: HtmlWidgetMJ(
                          htmlData: description ?? '<p>Hello, World!</p>',
                          customStyles: CustomHtmlStyles.styles(context),
                          onTapUrl: (url) async {
                            // print('#->>> BookingScreen onTapUrl: $url');
                            return true;
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                RamStickyButton(
                  isShowContent: true,
                  onKeyboard: true,
                  selectButtonText: '_accept_btn',
                  resetButtonText: '_decline_btn',
                  onPressedSelectButton: () async {
                    // print('#->>> BookingScreen onPressedSelectButton');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookingScreenController extends Cubit<void> {
  BookingScreenController() : super(null);

  Future<String> loadBodyJson() async {
    // Simulate loading JSON data (replace with actual loading logic)
    await Future.delayed(const Duration(seconds: 1));
    return '{"message": "Hello from JSON!"}';
  }
}
