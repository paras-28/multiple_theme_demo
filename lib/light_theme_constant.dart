import 'package:flutter/material.dart';

@immutable
class CustomThemes extends ThemeExtension<CustomThemes> {
  const CustomThemes({
    required this.loadingProgressIndicator,
    required this.brandColor,
    required this.appBarColor,
    required this.textColor,
    required this.backgroundColor,
    required this.appBartextColor,
  });

  final Color? loadingProgressIndicator;
  final Color? brandColor;
  final Color? appBarColor;
  final Color? appBartextColor;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  CustomThemes copyWith({
    Color? loadingProgressIndicator,
    Color? brandColor,
    Color? appBarColor,
    Color? textColor,
    Color? backgroundColor,
    Color? appBartextColor,
  }) {
    return CustomThemes(
      loadingProgressIndicator: loadingProgressIndicator ?? this.loadingProgressIndicator,
      brandColor: brandColor ?? this.brandColor,
      appBarColor : appBarColor ?? this.appBarColor,
      textColor: textColor ?? this.textColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      appBartextColor: appBartextColor ?? this.appBartextColor,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomThemes lerp(ThemeExtension<CustomThemes>? other, double t) {
    if (other is! CustomThemes) {
      return this;
    }
    return CustomThemes(
      loadingProgressIndicator: Color.lerp(loadingProgressIndicator, other.loadingProgressIndicator, t),
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      appBarColor: Color.lerp(appBarColor, other.appBarColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      appBartextColor: Color.lerp(appBartextColor, other.appBartextColor, t),
    );
  }

/*  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'loadingProgressIndicator: $loadingProgressIndicator, info: $brandColor, warning: $info, danger: $danger'
      ')';*/
  // the light theme
  static const light = CustomThemes(
      loadingProgressIndicator: Color(0xff6ECCAF),
      brandColor: Color(0xff6ECCAF),
      textColor: Colors.black,
      appBarColor: Color(0xff6B728E),
      backgroundColor : Color(0xffE5E5CB),
      appBartextColor : Colors.black,
  );

  // the dark theme
  static const dark = CustomThemes(
       loadingProgressIndicator: Colors.yellowAccent,
       brandColor: Color(0xffE5E5CB),
       textColor: Colors.white,
       appBarColor: Color(0xffFB7143),
       appBartextColor: Colors.white,
       backgroundColor : Color(0xff2D384B)
    // brandColor: Color(0xff6B728E)
  );
  // the dark theme
  static const pastel = CustomThemes(
      loadingProgressIndicator: Color(0xff060047),
      brandColor: Color(0xffFF5F9a),
      textColor: Colors.black,
      appBarColor: Color(0xff8CBBF1),
      appBartextColor: Colors.white,
      backgroundColor : Color(0xffffffff)
  );


}
