import 'package:flutter/material.dart';

class ProductDetailContainer extends StatefulWidget {
  const ProductDetailContainer({required this.description});

  final String description;

  @override
  State<ProductDetailContainer> createState() => _ProductDetailContainerState();
}

class _ProductDetailContainerState extends State<ProductDetailContainer> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Detail',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(isOpen ? Icons.expand_more : Icons.chevron_right),
              ],
            ),
          ),
        ),
        isOpen
            ? Text(
                widget.description,
                textAlign: TextAlign.justify,
              )
            : SizedBox()
      ],
    );
  }
}
