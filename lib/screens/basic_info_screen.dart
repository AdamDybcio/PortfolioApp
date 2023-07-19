import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/about_me_screen.dart';
import '../screens/skills_screen.dart';

import '../widgets/root_widgets/bg_with_buttons_widget.dart';
import '../widgets/basic_info_screen/basic_info_detail_widget.dart';

class BasicInfoScreen extends StatelessWidget {
  const BasicInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWithButtonsWidget(
      isHomePage: false,
      isLastPage: false,
      nextScreen: const SkillsScreen(),
      prevScreen: const AboutMeScreen(),
      children: [
        Stack(
          children: const [
            BasicInfoDetailWidget(
              isRight: true,
              listNum: 0,
              icon: FaIcon(FontAwesomeIcons.locationDot),
              delay: 0,
              text: 'Toruń',
            ),
            BasicInfoDetailWidget(
              isRight: false,
              listNum: 1,
              icon: FaIcon(FontAwesomeIcons.cakeCandles),
              delay: 1,
              text: '21',
            ),
            BasicInfoDetailWidget(
              isRight: true,
              listNum: 2,
              icon: FaIcon(FontAwesomeIcons.envelope),
              delay: 2,
              text: 'adam.dybcio.kontakt\n@gmail.com',
            ),
            BasicInfoDetailWidget(
              isRight: false,
              listNum: 3,
              icon: FaIcon(FontAwesomeIcons.buildingColumns),
              delay: 3,
              text: 'UMK\nin Toruń',
            ),
            BasicInfoDetailWidget(
              isRight: true,
              listNum: 4,
              icon: FaIcon(FontAwesomeIcons.github),
              delay: 4,
              text: 'https://github.com/\nAdamDybcio',
            ),
          ],
        ),
      ],
    );
  }
}
