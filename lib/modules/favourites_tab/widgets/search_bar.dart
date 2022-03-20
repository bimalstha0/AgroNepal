import 'package:flutter/material.dart';

import '../../../constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({required this.delegate, required this.label});

  final SearchDelegate delegate;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(context: context, delegate: delegate);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.08),
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(10),

        //color: Colors.grey.withOpacity(0.1),
        child: Row(
          children: [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Text(
              "Search for $label",
              style: TextStyle(color: Colors.black.withOpacity(0.4)),
            ),
          ],
        ),
      ),
    );
  }
}
