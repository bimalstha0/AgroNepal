import 'package:flutter/material.dart';

// final OrderDetail orderDetail = OrderDetail(items: [Items(product: )]);
class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2343',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('2021-Jan-21')
                    ],
                  ),
                  Text('Delivered')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('Delivered to: '),
              Text(
                'Pokhara Nepal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Payment Method: '),
              Text(
                'Khalti',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Divider(
                thickness: 1,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text('Cabbage x2'), Text('1 kg')],
                    ),
                    Text('Rs 500'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
