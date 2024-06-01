import 'package:flutter/material.dart';
import 'package:v_meet/utils/colors.dart';

class RowButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;

  const RowButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: buttonColor.withOpacity(0.06),
                  offset: const Offset(0, 4)
                )
              ]
            ),
            height: 60,
            width: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey
            ),
          )
        ],
      )
    );
  }
}