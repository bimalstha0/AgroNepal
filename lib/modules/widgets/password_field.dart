import 'package:agro_nepal/constants.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {required this.label, required this.controller, this.hint});

  final String label;
  final String? hint;
  final TextEditingController controller;
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: widget.controller,
        obscureText: !isVisible,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: Icon(
              isVisible ? Icons.visibility : Icons.visibility_off,
              color: greyColor,
            ),
          ),
          labelText: widget.label,
          hintText: widget.hint,
          labelStyle: TextStyle(color: greenDark),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: greenDark, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: greyColor, width: 1)),
        ),
      ),
    );
  }
}
