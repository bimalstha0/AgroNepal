import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';
import '../../../data/models/order/order.dart';
import '../../order_detail/order_detail_screen.dart';

class OrderTile extends StatelessWidget {
  const OrderTile(this.order);
  final Order order;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => OrderDetailScreen(), arguments: order.id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade100,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 3,
                  color: Colors.grey.shade300,
                  offset: Offset(1, 1)),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "#${order.id}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Rs-${order.total}",
                    style: TextStyle(color: greyColor),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateTime.parse(
                        order.dateOrdered ?? DateTime.now().toString())),
                    style: TextStyle(color: greenColor),
                  ),
                  Text("${order.status}", style: TextStyle(color: greyColor))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
