import 'dart:async';

import 'package:flutter/material.dart';

class SkillWidget extends StatefulWidget {
  final int listNum;
  final String name;
  const SkillWidget({
    super.key,
    required this.listNum,
    required this.name,
  });

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacityAnimation;
  late Animation<double> _marginAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    Timer(Duration(milliseconds: widget.listNum * 250), () {
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0, curve: Curves.linear),
      ),
    );
    _marginAnimation = Tween(begin: 0.0, end: 0.02).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn),
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
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 2,
                  color: widget.listNum <= 4
                      ? Colors.blueAccent
                      : Colors.purpleAccent,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * _marginAnimation.value +
                  widget.listNum * 0.075,
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.075,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (widget.listNum != 0)
                  const VerticalDivider(
                    color: Colors.purpleAccent,
                    width: 3,
                    indent: 15,
                    endIndent: 15,
                  ),
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: widget.listNum == 0 ? 30 : 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontStyle: widget.listNum == 0
                        ? FontStyle.italic
                        : FontStyle.normal,
                  ),
                ),
                if (widget.listNum != 0)
                  const VerticalDivider(
                    color: Colors.blueAccent,
                    width: 3,
                    indent: 15,
                    endIndent: 15,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
