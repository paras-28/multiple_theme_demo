import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiple_theme_demo/shared_pref.dart';
import 'package:multiple_theme_demo/theme_provider.dart';
import 'home_screen.dart';
import 'light_theme_constant.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  PreferenceManager.init();

  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_)
    {
      ref.read(themeProvider.notifier).getInitialTheme(WidgetsBinding.instance.window.platformBrightness);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      ThemeControllerState themestate = ref.watch(themeProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeDecider(themestate),
        home: const HomeScreen(),
      );
    });
  }

  themeDecider(ThemeControllerState themestate) {
    switch (themestate.currentTheme) {
      case CurrentTheme.light:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.light,
        ]);
      case CurrentTheme.dark:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.dark,
        ]);
      case CurrentTheme.pastel:
        return ThemeData().copyWith(extensions: <ThemeExtension<dynamic>>[
          CustomThemes.pastel,
        ]);
    }
  }
}
