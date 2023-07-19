import 'package:flutter/material.dart';

import 'author_widget.dart';

class BackgroundWidget extends StatelessWidget {
  final bool isHomePage;
  final List<Widget> children;
  const BackgroundWidget(
      {super.key, required this.isHomePage, required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: const [0.25, 0.5, 0.6, 0.75],
                colors: [
                  Colors.purpleAccent.shade400,
                  Colors.purpleAccent,
                  Colors.blueAccent,
                  Colors.blueAccent.shade400,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: children,
              ),
            ),
          ),
          if (isHomePage == false)
            const Align(
              alignment: Alignment.bottomCenter,
              child: AuthorWidget(),
            ),
        ],
      ),
    );
  }
}
