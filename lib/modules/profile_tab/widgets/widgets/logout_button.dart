import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () {
        Navigator.pushNamed(context, '/login');
      },
      child: SizedBox(
          width: 500,
          child: Stack(
            children: [
              Icon(Icons.logout_outlined),
              Center(child: Text("Log Out")),
            ],
          )),
      color: Colors.grey.shade300,
      elevation: 0,
    );
  }
}
