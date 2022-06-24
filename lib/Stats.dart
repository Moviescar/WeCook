import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({
    Key? key,
    required this.stat,
    required this.description,
    required this.statFontSize,
    required this.statDescFontSize,
  }) : super(key: key);
  final int statFontSize;
  final int statDescFontSize;
  final int stat;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          stat.toString(),
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white24,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
