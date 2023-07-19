import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BasicInfoDetailWidget extends StatefulWidget {
  final bool isRight;
  final int listNum;
  final FaIcon icon;
  final int delay;
  final String text;
  const BasicInfoDetailWidget({
    super.key,
    required this.icon,
    required this.delay,
    required this.text,
    required this.isRight,
    required this.listNum,
  });

  @override
  State<BasicInfoDetailWidget> createState() => _BasicInfoDetailWidgetState();
}

class _BasicInfoDetailWidgetState extends State<BasicInfoDetailWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _showAnimation;
  late Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    Timer(Duration(milliseconds: 500 * widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showAnimation = Tween(begin: 0.0, end: 0.35).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.bounceOut),
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: ((context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Align(
            alignment: widget.isRight
                ? const Alignment(0.75, 0.75)
                : const Alignment(-0.75, -0.75),
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height *
                    0.1 *
                    (widget.listNum + 1),
              ),
              height: MediaQuery.of(context).size.width * _showAnimation.value,
              width: MediaQuery.of(context).size.width * _showAnimation.value,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.listNum <= 2
                      ? Colors.blueAccent
                      : Colors.purpleAccent,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 4,
                    color: widget.listNum <= 2
                        ? Colors.blueAccent
                        : Colors.purpleAccent,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width *
                            _showAnimation.value *
                            0.5,
                        width: MediaQuery.of(context).size.width *
                            _showAnimation.value *
                            0.5,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Icon(
                            widget.icon.icon,
                            color: Colors.pinkAccent.withOpacity(0.4),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width *
                            _showAnimation.value *
                            0.75,
                        width: MediaQuery.of(context).size.width *
                            _showAnimation.value *
                            0.75,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            widget.text,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
