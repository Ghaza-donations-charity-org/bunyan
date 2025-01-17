import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/text_fields/text_field.dart';

import '../widget/submit_donation_button.dart';
class DonationAddressScreen extends StatefulWidget {
  const DonationAddressScreen({ super.key});

  @override
  State<DonationAddressScreen> createState() => _DonationAddressScreenState();
}

class _DonationAddressScreenState extends State<DonationAddressScreen> {
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick-up Address"),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [

            const Text("Please Enter the address you would like us to to pick-up the donation from"),
            const SizedBox(height: 50),
            TextFieldWidget(
              textController: addressController,
                hintText: "Address",
                labelText: "Address",
              ),
            const SizedBox(height: 50),

            const SubmitDonationButton(),

          ],
        ),
      ),

    );
  }
}
