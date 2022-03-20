// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../checkout_controller.dart';

enum PaymentMethod { cod, khalti }

class PaymentMethodContainer extends StatelessWidget {
  PaymentMethodContainer({required this.isCOD});
  final bool isCOD;

  Widget getPaymentTile(
      {required String image,
      required bool isSelected,
      required VoidCallback onPressed}) {
    return Expanded(
        child: GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: greenColor.withOpacity(0.1),
              border: Border.all(color: greenColor, width: isSelected ? 3 : 1),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Payment Method",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                getPaymentTile(
                  image: 'assets/icons/esewa.png',
                  isSelected: !isCOD,
                  onPressed: () {
                    Get.find<CheckoutController>().isCOD(false);
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                getPaymentTile(
                  image: 'assets/icons/cod.png',
                  isSelected: isCOD,
                  onPressed: () {
                    Get.find<CheckoutController>().isCOD(true);
                  },
                )
              ],
            ),
          )
        ]));
  }
}
