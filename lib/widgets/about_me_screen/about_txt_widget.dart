import 'package:flutter/material.dart';

class AboutMeTextWidget extends StatefulWidget {
  const AboutMeTextWidget({super.key});

  @override
  State<AboutMeTextWidget> createState() => _AboutMeTextWidgetState();
}

class _AboutMeTextWidgetState extends State<AboutMeTextWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textController;

  late Animation<double> _containerAnimation;
  late Animation<double> _textOpacityAnimation1;
  late Animation<double> _textOpacityAnimation2;
  late Animation<double> _textOpacityAnimation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7),
    );
    _controller.forward();
    _textController.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _containerAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(2 / 3, 1, curve: Curves.easeInOutCubic),
      ),
    );
    _textOpacityAnimation1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(3 / 7, 1, curve: Curves.linear),
      ),
    );
    _textOpacityAnimation2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(4 / 7, 1, curve: Curves.linear),
      ),
    );
    _textOpacityAnimation3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(5 / 7, 1, curve: Curves.linear),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _containerAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _containerAnimation.value,
          child: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(80),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.blueAccent,
                    blurRadius: 10,
                    spreadRadius: 4,
                    offset: Offset(5, -5),
                  ),
                  BoxShadow(
                    color: Colors.purpleAccent,
                    blurRadius: 10,
                    spreadRadius: 4,
                    offset: Offset(-5, 5),
                  ),
                ],
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.width * 0.05,
                ),
                child: AnimatedBuilder(
                  animation: _textController,
                  builder: (context, child) {
                    return Column(
                      children: [
                        Opacity(
                          opacity: _textOpacityAnimation1.value,
                          child: const Text(
                            'Hi! \n My name is Adam Dybcio.',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 14 * 1.2,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Divider(
                          height: 20,
                          color: Colors.purpleAccent,
                          indent: MediaQuery.of(context).size.width * 0.1,
                          endIndent: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Opacity(
                          opacity: _textOpacityAnimation2.value,
                          child: const Text(
                            'I am a second year student of engineering computer science.',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: _textOpacityAnimation2.value,
                          child: const Text(
                            'For over a year my hobby has definitely been programming in Flutter.\nMy dream would be to get a job as a Flutter developer so I could develop and unlock my full potential.',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: _textOpacityAnimation2.value,
                          child: const Text(
                            'In the further part of the application, I will tell you a little about myself, my experience and skills.',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Divider(
                          height: 20,
                          color: Colors.blueAccent,
                          indent: MediaQuery.of(context).size.width * 0.1,
                          endIndent: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Opacity(
                          opacity: _textOpacityAnimation3.value,
                          child: Text(
                            'Have fun reading and watching!',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              height:
                                  MediaQuery.of(context).size.height * 0.004,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
