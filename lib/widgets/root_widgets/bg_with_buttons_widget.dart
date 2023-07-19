import 'package:flutter/material.dart';

import '/widgets/root_widgets/button_widget.dart';
import '/widgets/root_widgets/backgorund_widget.dart';

class BgWithButtonsWidget extends StatelessWidget {
  final bool isHomePage;
  final bool isLastPage;
  final List<Widget> children;
  final Widget nextScreen;
  final Widget prevScreen;
  const BgWithButtonsWidget({
    super.key,
    required this.isHomePage,
    required this.children,
    required this.nextScreen,
    required this.prevScreen,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundWidget(isHomePage: isHomePage, children: children),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.025,
                bottom: MediaQuery.of(context).size.height * 0.075,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ButtonWidget(
                  delay: 1,
                  text: 'Back',
                  nextPage: prevScreen,
                  height: 0.075,
                  isPrev: true,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.025,
                bottom: MediaQuery.of(context).size.height * 0.075,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ButtonWidget(
                  delay: 1,
                  text: isLastPage ? 'End' : 'Next',
                  nextPage: nextScreen,
                  height: 0.075,
                  isPrev: false,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
