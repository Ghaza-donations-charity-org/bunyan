import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/text_fields/text_field.dart';
import 'package:ghaza_donations_app/features/make_donation_screen/controller/donation_controller.dart';
import 'package:ghaza_donations_app/features/make_donation_screen/view/widget/submit_donation_button.dart';
import 'package:provider/provider.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({super.key});

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  late final MakeDonationController makeDonationController;
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController ccvController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();

  @override
  void initState() {
    makeDonationController = Provider.of<MakeDonationController>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Online Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                textController: cardNumberController,
                labelText: "Card Number",
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                textController: ccvController,
                labelText: "CCV",
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                textController: expirationDateController,
                labelText: "Expiration Date",
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 50),
              SubmitDonationButton(
                onPressed: () => makeDonationController.setPaymentInfo(
                    cardNumber: cardNumberController.text,
                    expiryDate: expirationDateController.text,
                    cvv: ccvController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
