import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_theme_demo/shared_pref.dart';

final themeProvider =
StateNotifierProvider<ThemeController, ThemeControllerState>((ref) {
  return ThemeController();
});

enum CurrentTheme { dark, light, pastel}

extension CurrentThemeExtensionOnEnum on CurrentTheme {
  String get currentThemeString {
    switch (this) {
      case CurrentTheme.light:
        return 'light';
      case CurrentTheme.dark:
        return 'dark';
      case CurrentTheme.pastel:
        return 'pastel';
    }
  }
}

extension CurrentThemeExtensionOnString on String {
  CurrentTheme? get  currentThemeEnum {
    switch (this) {
      case 'light':
        return CurrentTheme.light;
      case 'dark':
        return CurrentTheme.dark;
      case 'pastel':
        return CurrentTheme.pastel;
    }
  }
}



class ThemeControllerState {
  CurrentTheme currentTheme = CurrentTheme.light;

  ThemeControllerState({
    required this.currentTheme,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeControllerState &&
          runtimeType == other.runtimeType &&
          currentTheme == other.currentTheme);

  ThemeControllerState copyWith({
    CurrentTheme? currentTheme,
  }) {
    return ThemeControllerState(
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }
}

class ThemeController extends StateNotifier<ThemeControllerState> {
  ThemeController()
      : super(ThemeControllerState(currentTheme: CurrentTheme.light));

  changeTheme({required CurrentTheme newTheme}) {
    state = state.copyWith(currentTheme: newTheme);
    PreferenceManager.setString(
        SharedPreferencesKey.selectedTheme, newTheme.currentThemeString);
  }

  getInitialTheme(Brightness brightness) {
    String? selectedTheme = PreferenceManager.getString(
        SharedPreferencesKey.selectedTheme);
    if (selectedTheme is String) {
      state = state.copyWith(
          currentTheme: selectedTheme.currentThemeEnum ?? CurrentTheme.light
      );
    }
    else {
      state = state.copyWith(
          currentTheme: brightness == Brightness.light ? CurrentTheme.light :
          CurrentTheme.dark
      );
    }
  }
}
