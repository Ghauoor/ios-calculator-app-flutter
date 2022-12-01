import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPress;

  const Button({
    Key? key,
    required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: InkWell(
          onTap: onPress,
          child: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            height: mediaQuery.height / 9,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
