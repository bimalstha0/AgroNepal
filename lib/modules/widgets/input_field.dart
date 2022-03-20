import 'package:flutter/material.dart';

import '../../constants.dart';

class InputField extends StatelessWidget {
  const InputField(
      {required this.label,
      this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.controller});
  final String label;
  final TextEditingController? controller;
  final TextInputType inputType;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: inputType,
        controller: controller,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          labelText: label,
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
