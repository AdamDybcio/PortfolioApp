import 'dart:async';

import 'package:flutter/material.dart';

import '../../routes/custom_page_route.dart';

class ButtonWidget extends StatefulWidget {
  final int delay;
  final String text;
  final Widget nextPage;
  final double height;
  final bool isPrev;
  const ButtonWidget(
      {super.key,
      required this.delay,
      required this.text,
      required this.nextPage,
      required this.height,
      required this.isPrev});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      reverseDuration: const Duration(seconds: 1),
    );
    Timer(Duration(seconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * widget.height,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 3,
                      color: Colors.purpleAccent,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: _opacityAnimation.value == 1.0
                      ? () {
                          _controller.reverse().then(
                                (value) => {
                                  Navigator.of(context).pushReplacement(
                                    CustomPageRoute(
                                      widget.nextPage,
                                    ),
                                  ),
                                },
                              );
                        }
                      : null,
                  style: ButtonStyle(
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.purpleAccent),
                      elevation: MaterialStateProperty.all<double>(3.0),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  child: child,
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.isPrev)
                const Icon(
                  Icons.arrow_left,
                  color: Colors.purple,
                ),
              Text(
                widget.text,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.0015,
              ),
              if (!widget.isPrev)
                const Icon(
                  Icons.arrow_right,
                  color: Colors.purple,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
