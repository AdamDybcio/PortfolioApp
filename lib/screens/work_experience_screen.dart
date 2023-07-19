import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/skills_screen.dart';

import '../widgets/root_widgets/bg_with_buttons_widget.dart';
import '../widgets/work_experience_screen/work_experience_widget.dart';

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BgWithButtonsWidget(
      isHomePage: false,
      isLastPage: true,
      nextScreen: HomeScreen(),
      prevScreen: SkillsScreen(),
      children: [
        WorkExperienceWidget(
          num: 0,
          side: 'r',
          city: 'Brodnica',
          date: 'May 2020 (2 weeks)',
          company: 'MIKOBUD sp. z o.o.',
          desc:
              'Programming CNC machines, creating appropriate shapes and sizes of elements in the program.',
        ),
        WorkExperienceWidget(
          num: 1,
          side: 'l',
          city: 'Toruń',
          date: 'June 2020 (1 month)',
          company: 'SpecINFO s.c',
          desc:
              'Web application development with the main emphasis on PHP, using the Laravel framework.',
        ),
        WorkExperienceWidget(
          num: 2,
          side: 'r',
          city: 'Toruń',
          date: 'April 2021 (3 weeks)',
          company: 'SpecINFO s.c',
          desc:
              'Creating simple applications using PHP, JavaScript, HTML and CSS. Also using GitHub.',
        ),
      ],
    );
  }
}
