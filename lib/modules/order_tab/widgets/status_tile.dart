import 'package:flutter/material.dart';

import '../../../constants.dart';

class StatusTile extends StatelessWidget {
  const StatusTile(this.title, this.isSelected);
  final String title;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isSelected ? greenColor : Colors.transparent,
      ),
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(minWidth: 50),
      child: Center(
        child: Text(
          "$title",
          style: TextStyle(color: isSelected ? Colors.white : greenColor),
        ),
      ),
    );
  }
}
