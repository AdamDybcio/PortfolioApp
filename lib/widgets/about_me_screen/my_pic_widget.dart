import 'package:flutter/material.dart';

class MyPicWidget extends StatefulWidget {
  const MyPicWidget({super.key});

  @override
  State<MyPicWidget> createState() => _MyPicWidgetState();
}

class _MyPicWidgetState extends State<MyPicWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _opacityAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0, curve: Curves.easeOutQuint),
      ),
    );
    _sizeAnimation = Tween(begin: 0.0, end: 0.25).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 1.0, curve: Curves.easeOutQuint),
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
            height: MediaQuery.of(context).size.height * _sizeAnimation.value,
            width: MediaQuery.of(context).size.height * _sizeAnimation.value,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.05,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 8,
                color: Colors.blueAccent,
              ),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/myPic.png'),
              ),
              boxShadow: const [
                BoxShadow(
                  spreadRadius: 4,
                  blurRadius: 20,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
