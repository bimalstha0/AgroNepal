import 'package:flutter/material.dart';

import '../../../data/models/product/cart_item.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary(this.cartItems, {Key? key}) : super(key: key);
  final List<CartItem> cartItems;

  double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order Summary",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItems[index].product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "Rs. ${cartItems[index].product.price}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    Text("x${cartItems[index].quantity}"),
                    Text(
                      "Rs. ${cartItems[index].quantity * cartItems[index].product.price} ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Total : \t Rs ${getTotal()}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
