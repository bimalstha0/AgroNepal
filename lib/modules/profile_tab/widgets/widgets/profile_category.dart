import 'package:agro_nepal/constants.dart';
import 'package:flutter/material.dart';

class ProfileCategory extends StatelessWidget {
  const ProfileCategory({
    Key? key,
    required this.icon,
    required this.text,
    required this.onPress,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.black.withOpacity(0.5),
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.black.withOpacity(0.1),
        ),
        onPressed: onPress,
        child: Row(
          children: [
            Icon(
              icon,
              color: greenDark,
              size: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
