import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'drop_down_theme_changer.dart';
import 'light_theme_constant.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomThemes themeData = Theme.of(context).extension<CustomThemes>()!;
    return Scaffold(
        backgroundColor: themeData.backgroundColor,
        appBar: AppBar(
          title: Text(
            "Theme Changer",
            style: TextStyle(color: themeData.appBartextColor),
          ),
          backgroundColor: themeData.appBarColor,
          actions: const [
            ThemeChangerWidget(),
          ],
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            color: themeData.brandColor,
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            alignment: Alignment.center,
            child: Text("Brand Color",style: TextStyle(fontSize: 30)),
          ),
        ));
  }
}
