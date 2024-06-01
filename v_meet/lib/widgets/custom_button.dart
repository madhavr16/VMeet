import 'package:flutter/material.dart';
import 'package:v_meet/utils/colors.dart';

class CustomButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        //minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        )
      ),
      child: Text(
        text, 
        style: const TextStyle(
          fontSize: 17
        )
      ),
    );
  }
}