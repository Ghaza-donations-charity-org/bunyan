import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/alert_dialog.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/buttons/button_widget.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/drop_down_menu_widget.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/text_fields/text_field.dart';
import 'package:provider/provider.dart';
import '../../../../common_mvc/common_controller/common_utility_classes/image_utils.dart';
import '../../../../common_mvc/common_view/theme/app_colors.dart';
import '../../controller/donation_controller.dart';

class MakeDonationScreen extends StatefulWidget {
  final DonationGoal donationGoal;
  const MakeDonationScreen({required this.donationGoal, super.key});

  @override
  State<MakeDonationScreen> createState() => _MakeDonationScreenState();
}

class _MakeDonationScreenState extends State<MakeDonationScreen> {
  final TextEditingController donationAmountController =
      TextEditingController();
  final TextEditingController donationMethodController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final makeDonationController = Provider.of<MakeDonationController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Make a donation"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                image(),
                const SizedBox(
                  height: 20,
                ),
                title(),
                const SizedBox(
                  height: 20,
                ),
                const Text("Donation amount:"),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  textController: donationAmountController,
                  labelText: 'Donation amount',
                  hintText: 'Donation amount',

                    keyboardType: TextInputType.number,
                    onSubmitted: (value) {
                      if (!makeDonationController.validateDonationAmount(value!)) {
                        showDialog(context: context, builder: (context) => const AlertDialogWidget(
                          title: "Invalid donation amount",
                          contentText: "Please enter a valid donation amount",
                        ));
                        // Show an error message or update UI accordingly
                        print("Invalid donation amount");
                      }
                    },
                  ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Donation method:"),
                const SizedBox(
                  height: 10,
                ),
                donationMethodDropDownMenu(),

                const SizedBox(
                  height: 40,
                ),
                proceedButton(),

              ],
            ),
          ),
        ),
    );
  }

  //========================================================================//
  //=============================== Image ==================================//

  Widget image() {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        image: DecorationImage(
            image: ImageUtilityFunctions.getImage(widget.donationGoal.imageUrl),
            fit: BoxFit.cover),
      ),
    );
  }

  //========================================================================//
  //=============================== Title ==================================//

  Widget title() {
    return Text(
        widget.donationGoal.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.brightTextColor,
        ),
    );
  }

  Widget donationMethodDropDownMenu() {
    return widget.donationGoal.unit.toLowerCase() == "usd"
        ? DropDownMenuWidget(
            textController: donationMethodController,
            dropdownItemsAsStrings: const ['Online payment', 'Home pick-up'],
            label: 'Donation method',
            textColor: AppColors.textPrimaryColor,
          )
        : DropDownMenuWidget(
            textController: donationMethodController,
            dropdownItemsAsStrings: const [
              'Home pick-up',
              'Nearest donation center'
            ],
            label: 'Donation method',
            textColor: AppColors.textPrimaryColor,
          );
  }

  Widget proceedButton(){
    return ButtonWidget(
      onPressed: (){},
      child: const Text("Proceed"),
    );
  }
}

//
// class MakeDonationScreen extends StatefulWidget {
//   final DonationGoal donationGoal;
//
//   const MakeDonationScreen({required this.donationGoal, super.key});
//
//   @override
//   State<MakeDonationScreen> createState() => _MakeDonationScreenState();
// }
//
// class _MakeDonationScreenState extends State<MakeDonationScreen> {
//   final TextEditingController donationAmountController =
//   TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final makeDonationController = Provider.of<MakeDonationController>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Make a Donation"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: donationAmountController,
//               decoration: const InputDecoration(labelText: "Donation Amount"),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 if (!makeDonationController.validateDonationAmount(value)) {
//                   // Show an error message or update UI accordingly
//                   print("Invalid donation amount");
//                 }
//               },
//             ),
//             const SizedBox(height: 16),
//             DropdownButton<String>(
//               value: makeDonationController.donationMethod,
//               hint: const Text("Select Donation Method"),
//               items: ["Credit Card", "PayPal", "Bank Transfer"]
//                   .map((method) => DropdownMenuItem(
//                 value: method,
//                 child: Text(method),
//               ))
//                   .toList(),
//               onChanged: (value) {
//                 if (value != null) {
//                   makeDonationController.setDonationMethod(value);
//                 }
//               },
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await makeDonationController.submitDonation();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Donation submitted successfully!")),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text("Error: $e")),
//                   );
//                 }
//               },
//               child: const Text("Submit Donation"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }