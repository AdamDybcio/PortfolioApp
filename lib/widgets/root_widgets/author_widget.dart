import 'package:flutter/material.dart';

class AuthorWidget extends StatelessWidget {
  const AuthorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.05,
      color: Colors.white.withOpacity(0.25),
      child: const Center(
          child: Text(
        'Portfolio - Adam Dybcio',
        style: TextStyle(
          color: Colors.white,
          fontStyle: FontStyle.italic,
        ),
      )),
    );
  }
}
