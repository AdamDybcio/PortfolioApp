import 'package:flutter/material.dart';

import '../screens/about_me_screen.dart';

import '../widgets/home_screen/header_text_widget.dart';
import '../widgets/home_screen/logo_widget.dart';
import '../widgets/root_widgets/button_widget.dart';
import '../widgets/root_widgets/backgorund_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      isHomePage: true,
      children: [
        const LogoWidget(),
        const HeaderTextWidget(
          text: 'Portfolio',
          size: 0.1,
          color: Colors.blueAccent,
        ),
        const HeaderTextWidget(
          text: 'Adam Dybcio',
          size: 0.05,
          color: Colors.purpleAccent,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        const ButtonWidget(
          text: 'Start',
          delay: 1,
          nextPage: AboutMeScreen(),
          height: 0.125,
          isPrev: false,
        ),
      ],
    );
  }
}
