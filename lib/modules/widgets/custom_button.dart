import 'package:agro_nepal/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // final VoidCallback onPress;
  final String text;
  final VoidCallback onPressed;

  const CustomButton(
    this.text,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onPressed: onPressed,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
      ),
      color: greenColor,
      elevation: 0,
    );
  }
}
