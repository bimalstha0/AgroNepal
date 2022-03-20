import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/input_field.dart';
import '../checkout_controller.dart';

class ShippingAddressEditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutController>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Shipping Adress'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 20,
          ),
          child: Column(
            children: [
              InputField(
                label: 'Phone Number',
                controller: controller.phoneController,
                inputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: greenDark, width: 1)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: greyColor, width: 1)),
                        labelText: 'Province',
                        labelStyle: TextStyle(color: Colors.grey)),
                    value: controller.selectedProvince,
                    onChanged: (String? newValue) {
                      controller.selectedProvince = newValue;
                    },
                    items: controller.provinces
                        .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                            child: Text(
                              value,
                            ),
                            value: value,
                          ),
                        )
                        .toList()),
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                label: 'City',
                controller: controller.cityController,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 20,
              ),
              InputField(
                label: 'Address',
                controller: controller.addressController,
                inputType: TextInputType.streetAddress,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton('Update', () {
                controller.updateAddress();
              })
            ],
          ),
        ),
      ),
    );
  }
}
