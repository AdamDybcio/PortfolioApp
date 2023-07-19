import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkExperienceWidget extends StatefulWidget {
  final String side;
  final int num;
  final String city;
  final String date;
  final String company;
  final String desc;
  const WorkExperienceWidget(
      {super.key,
      required this.side,
      required this.num,
      required this.city,
      required this.date,
      required this.company,
      required this.desc});

  @override
  State<WorkExperienceWidget> createState() => _WorkExperienceWidgetState();
}

class _WorkExperienceWidgetState extends State<WorkExperienceWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    Timer(Duration(milliseconds: 2000 * widget.num), () {
      _controller.forward();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _slideAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.75, curve: Curves.bounceOut),
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.75, 1.0, curve: Curves.linear),
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
        return Container(
          height: MediaQuery.of(context).size.height * 0.25,
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Container(
            margin: EdgeInsets.only(
              left: widget.side == 'r'
                  ? MediaQuery.of(context).size.width * _slideAnimation.value
                  : 0,
              right: widget.side == 'l'
                  ? MediaQuery.of(context).size.width * _slideAnimation.value
                  : 0,
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  spreadRadius: 3,
                  color:
                      widget.num <= 1 ? Colors.blueAccent : Colors.purpleAccent,
                  offset: const Offset(1, 1),
                ),
              ],
            ),
            child: Card(
              color: Colors.white,
              shadowColor: Colors.greenAccent,
              child: _slideAnimation.value == 0.0
                  ? Opacity(
                      opacity: _opacityAnimation.value,
                      child: Wrap(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const FaIcon(
                                  FontAwesomeIcons.city,
                                  color: Colors.purpleAccent,
                                ),
                                title: Text(
                                  widget.city,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                subtitle: Text(widget.date,
                                    textAlign: TextAlign.right),
                                trailing: const FaIcon(
                                  FontAwesomeIcons.calendar,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              Divider(
                                height: 3,
                                color: Colors.blueAccent,
                                indent: MediaQuery.of(context).size.width * 0.2,
                                endIndent:
                                    MediaQuery.of(context).size.width * 0.2,
                              ),
                              ListTile(
                                leading: const FaIcon(
                                  FontAwesomeIcons.laptop,
                                  color: Colors.purpleAccent,
                                ),
                                title: Text(widget.company),
                                subtitle: Text(
                                  widget.desc,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}
