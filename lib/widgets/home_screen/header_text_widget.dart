import 'package:flutter/material.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const HeaderTextWidget(
      {super.key, required this.text, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * size,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                color: color,
                blurRadius: 1,
                offset: const Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
