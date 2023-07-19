import 'package:flutter/material.dart';

import '/screens/home_screen.dart';
import '/screens/basic_info_screen.dart';

import '/widgets/root_widgets/bg_with_buttons_widget.dart';
import '../widgets/about_me_screen/about_txt_widget.dart';
import '../widgets/about_me_screen/my_pic_widget.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BgWithButtonsWidget(
        isHomePage: false,
        isLastPage: false,
        nextScreen: BasicInfoScreen(),
        prevScreen: HomeScreen(),
        children: [
          MyPicWidget(),
          AboutMeTextWidget(),
        ]);
  }
}
