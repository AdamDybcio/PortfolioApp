import 'package:flutter/material.dart';

import '../screens/basic_info_screen.dart';
import '../screens/work_experience_screen.dart';

import '../widgets/root_widgets/bg_with_buttons_widget.dart';
import '../widgets/skills_screen/skill_widget.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BgWithButtonsWidget(
      isHomePage: false,
      isLastPage: false,
      nextScreen: const WorkExperienceScreen(),
      prevScreen: const BasicInfoScreen(),
      children: [
        const Flexible(
          child: SkillWidget(listNum: 0, name: 'SKILLS'),
        ),
        const Flexible(
          child: SkillWidget(listNum: 1, name: 'Animations'),
        ),
        const Flexible(
          child: SkillWidget(listNum: 2, name: 'State Management (+ BLoC)'),
        ),
        const Flexible(
          child: SkillWidget(listNum: 3, name: 'REST (http, Dio)'),
        ),
        const Flexible(
          child: SkillWidget(listNum: 4, name: 'Firebase'),
        ),
        const Flexible(
          child: SkillWidget(listNum: 5, name: 'Git'),
        ),
        const Flexible(
          child: SkillWidget(listNum: 6, name: 'CI / CD (Codemagic)'),
        ),
        const Flexible(
          child: SkillWidget(listNum: 7, name: 'App Distribution'),
        ),
        Flexible(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ),
      ],
    );
  }
}
