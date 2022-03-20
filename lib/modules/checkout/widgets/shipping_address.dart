import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../checkout_controller.dart';
import '../shipping_address/shippping_address_edit.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key}) : super(key: key);
  Widget getAddressRow({required String label, required String data}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ),
        Expanded(
            child: Text(
          data,
          style: TextStyle(color: Colors.grey.shade600),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Shiping Address',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                controller.shippingAddress == null
                    ? const SizedBox()
                    : TextButton(
                        onPressed: () {
                          Get.to(() => ShippingAddressEditScreen());
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(color: greyColor),
                        ))
              ],
            ),
            controller.shippingAddress == null
                ? MaterialButton(
                    onPressed: () {
                      Get.to(() => ShippingAddressEditScreen());
                    },
                    child: Text(
                      "Add Shipping Address",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: greenColor,
                  )
                : Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greenColor.withOpacity(0.1)),
                    child: Column(
                      children: [
                        getAddressRow(
                            label: "Phone Number",
                            data: controller.shippingAddress!['phone']!),
                        getAddressRow(
                            label: "Province",
                            data: controller.shippingAddress!['province']!),
                        getAddressRow(
                            label: "City",
                            data: controller.shippingAddress!['city']!),
                        getAddressRow(
                            label: "Full Address",
                            data: controller.shippingAddress!['address']!)
                      ],
                    ))
          ],
        ),
      );
    });
  }
}
