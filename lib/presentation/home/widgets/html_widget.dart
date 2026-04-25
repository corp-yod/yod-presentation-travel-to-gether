// ignore_for_file: depend_on_referenced_packages, public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/dom.dart' as dom;
import 'package:yod_nak_ram_ui_kit/yod_nak_ram_ui_kit.dart';

class HtmlWidgetMJ extends StatelessWidget {
  /// Constructs a widget with the given [htmlData] and optional parameters.
  const HtmlWidgetMJ({
    required this.htmlData,
    this.customStyles,
    this.customTextStyle,
    this.onTapUrl,
    this.customUlPadding = 16,
    this.customOlPadding = 16,
    super.key,
  });

  final String htmlData;
  final Map<String, Map<String, String>>? customStyles;
  final TextStyle? customTextStyle;
  final FutureOr<bool> Function(String)? onTapUrl;
  final int customUlPadding;
  final int customOlPadding;

  @override
  Widget build(BuildContext context) {
    final ramTextStyle = context.ramTextStyle;
    final ramThemeColors = context.ramThemeColors;

    // print('#->>> HtmlWidgetMJ build with htmlData: $htmlData');

    return HtmlWidget(
      htmlData,
      textStyle:
          customTextStyle ??
          ramTextStyle.bodyMedium.copyWith(color: ramThemeColors.textIconText),
      customStylesBuilder: (element) {
        final Map<String, String> styles = {};

        if (customStyles != null) {
          if (customStyles!.containsKey(element.localName)) {
            styles.addAll(customStyles![element.localName]!);
          }
        }

        styles.addAll(
          classStylesForElementNew(
            element,
            ramThemeColors,
            ramTextStyle,
            customTextStyle,
          ),
        );

        return styles;
      },
      customWidgetBuilder: (element) {
        if (element.localName == 'hr') {
          return Padding(
            padding: const EdgeInsets.only(bottom: kPadding5),
            child: Divider(
              color: ramThemeColors.bgBorderContainer,
              thickness: 1,
            ),
          );
        }
        return null;
      },
      onTapUrl: onTapUrl,
    );
  }

  Map<String, String> classStylesForElementNew(
    dom.Element element,
    RamThemeColors myaColors,
    RamTextStyle ramTextStyle,
    TextStyle? customTextStyle,
  ) {
    // Extract custom attributes or apply defaults
    final String? fontToken = element.attributes['data-myais-font-token'];
    final String? colorToken = element.attributes['data-myais-color-token'];

    // Get color and text style
    Color? color;
    if (colorToken != null) {
      color = myaColors.getColor(colorToken);
    } else if (customTextStyle != null) {
      color = customTextStyle.color;
    }

    TextStyle? textStyle = fontToken != null
        ? ramTextStyle.getTextStyle(fontToken)
        : null;

    if (fontToken == null && customTextStyle != null) {
      textStyle = textStyle?.copyWith(
        fontStyle: customTextStyle.fontStyle,
        fontSize: customTextStyle.fontSize,
        fontFamily: customTextStyle.fontFamily,
        fontWeight: customTextStyle.fontWeight,
        height: customTextStyle.height,
      );
    }
    Map<String, String> result = {};
    if (color != null) {
      result.addAll({'color': '${colorToHexNew(color)} !important'});
    }
    if (textStyle != null) {
      result.addAll({
        'font-style':
            '${textStyle.fontStyle?.toString() ?? 'normal'} !important',
        'font-family': '${textStyle.fontFamily ?? 'Arial'} !important',
        'font-size': '${textStyle.fontSize ?? 14}px !important',
        'font-weight': '${textStyle.fontWeight?.value ?? 'normal'} !important',
        'line-height': '${textStyle.height ?? '1'} !important',
      });
    }

    if (element.localName == 'a' && colorToken == null) {
      result.addAll({
        'color': '${colorToHexNew(myaColors.primaryOnSurface)} !important',
        'text-decoration': 'underline',
        'text-decoration-color':
            '${colorToHexNew(myaColors.primaryOnSurface)} !important',
      });
    }

    if (element.localName == 'ul') {
      result.addAll({'padding-left': '${customUlPadding}px', 'margin': '0'});
    }

    if (element.localName == 'ol') {
      result.addAll({'padding-left': '${customOlPadding}px', 'margin': '0'});
    }

    return result;
  }
}

String colorToHexNew(Color color) {
  return '#'
      '${color.red.toRadixString(16).padLeft(2, '0')}'
      '${color.green.toRadixString(16).padLeft(2, '0')}'
      '${color.blue.toRadixString(16).padLeft(2, '0')}';
}

class CustomHtmlStyles {
  static Map<String, Map<String, String>>? styles(
    BuildContext context, {
    TextStyle? headerStyle,
    TextStyle? descStyle,
  }) {
    final ramThemeColors = context.ramThemeColors;
    final ramTextStyle = context.ramTextStyle;
    headerStyle ??= ramTextStyle.titleMedium.copyWith(
      color: ramThemeColors.primaryOnSurface,
      fontWeight: ramTextStyle.bodyLarge.fontWeight,
      fontStyle: ramTextStyle.bodyLarge.fontStyle,
      fontSize: ramTextStyle.bodyLarge.fontSize,
      fontFamily: ramTextStyle.bodyLarge.fontFamily,
    );

    descStyle ??= ramTextStyle.bodyMediumExtraThin.copyWith(
      color: ramThemeColors.textIconText,
      fontWeight: ramTextStyle.bodyMedium.fontWeight,
      fontStyle: ramTextStyle.bodyMedium.fontStyle,
      fontSize: ramTextStyle.bodyMedium.fontSize,
      fontFamily: ramTextStyle.bodyMedium.fontFamily,
    );
    return {
      'h1': {
        'color': colorToHexNew(
          headerStyle.color ?? ramThemeColors.primaryOnSurface,
        ),
        'font-size': '${headerStyle.fontSize ?? 32}px',
        'font-weight': '${headerStyle.fontWeight?.value ?? '500'}',
        'font-family': headerStyle.fontFamily ?? 'Arial',
      },
      'p': {
        'color': colorToHexNew(descStyle.color ?? ramThemeColors.textIconText),
        'font-size': '${descStyle.fontSize ?? 32}px',
        'font-weight': '${descStyle.fontWeight?.value ?? '500'}',
        'font-family': descStyle.fontFamily ?? 'Arial',
      },
    };
  }
}
