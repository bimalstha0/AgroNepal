import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/order/order.dart';
import '../app_controller.dart';
import 'order_controller.dart';
import 'widgets/order_tile.dart';
import 'widgets/status_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int selectedIndex = 0;
  final PageController pageController = PageController();
  final controller = Get.find<OrderController>();
  Widget getOrders(String status) {
    List<Order> selectedOrders = [];
    if (status == "All") {
      selectedOrders = controller.orders;
    } else {
      for (Order orders in controller.orders) {
        if (orders.status == status) {
          selectedOrders.add(orders);
        }
      }
    }
    return selectedOrders.isEmpty
        ? Center(child: Text('No Orders.'))
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return OrderTile(selectedOrders[index]);
              },
              itemCount: selectedOrders.length,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
      ),
      body: Obx(() => Get.find<AppController>().isLoggedIn.isTrue
          ? RefreshIndicator(
              onRefresh: () async {},
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  StatusBar(
                    onPressed: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                      pageController.jumpToPage(index);
                    },
                    selectedIndex: selectedIndex,
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      children: [
                        getOrders('All'),
                        getOrders('Pending'),
                        getOrders('Processing'),
                        getOrders('Delivered'),
                        getOrders('Cancelled')
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Login to View Order History',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
