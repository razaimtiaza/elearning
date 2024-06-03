import 'package:e_learning/utililts/colors/color.dart';
import 'package:flutter/material.dart';

class CoutomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  const CoutomButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.height * 0.35,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(circlebar),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11)))),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18, color: Color.fromARGB(255, 3, 3, 3)),
        ),
      ),
    );
  }
}
