import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_theme_demo/theme_provider.dart';

class ThemeChangerWidget extends StatelessWidget {
  const ThemeChangerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ThemeControllerState themeState = ref.watch(themeProvider);
      return Padding(
        padding:  EdgeInsets.only(right: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<CurrentTheme>(
            value: themeState.currentTheme,
            items:  const <DropdownMenuItem<CurrentTheme>>[
              DropdownMenuItem(
                value: CurrentTheme.light,
                child: Text('Light'),
              ), DropdownMenuItem(
                value: CurrentTheme.dark,
                child: Text('Dark'),
              ), DropdownMenuItem(
                value: CurrentTheme.pastel,
                child: Text('Pastel'),
              ),
            ],
            onChanged: (CurrentTheme? value) {
              if (value != null) {
                ref.read(themeProvider.notifier).changeTheme(newTheme: value);
              }
            },
          ),
        ),
      );
    });
  }
}
