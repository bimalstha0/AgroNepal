import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({required this.icon, required this.press});

  final String icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: press,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(12),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFF5F6F9),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              icon,
              fit: BoxFit.fitHeight,
            ),
          ),
        )
      ],
    );
  }
}
