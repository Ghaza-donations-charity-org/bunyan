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
  late final MakeDonationController makeDonationController;
  @override
  void initState() {
    makeDonationController =
        Provider.of<MakeDonationController>(context, listen: false);
    makeDonationController.donationMethod = "Home pick-up";
    makeDonationController.setDonationGoal(widget.donationGoal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                "Donation amount:",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                textController: donationAmountController,
                labelText: 'Donation amount',
                hintText: 'Donation amount',
                keyboardType: TextInputType.number,
                onChanged: (value) {
                      makeDonationController.setDonationAmount(donationAmountController.text);
                },
                onSubmitted: (value) {
                  if (!makeDonationController.validateDonationAmount(value!)) {
                    showDialog(
                        context: context,
                        builder: (context) => const AlertDialogWidget(
                              title: "Invalid donation amount",
                              contentText:
                                  "Please enter a valid donation amount",
                            ));
                  }
                  else
                    {
                      makeDonationController.setDonationAmount(donationAmountController.text);
                    }
                },

              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Donation method:",
                style: Theme.of(context).textTheme.titleSmall,
              ),
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
        ? DropdownButton<String>(
            value: makeDonationController.donationMethod,
            style: Theme.of(context).textTheme.bodyMedium,
            hint: Text(
              "Select Donation Method",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            items: const ['Online payment', 'Home pick-up']
                .map((method) => DropdownMenuItem(
                      value: method,
                      child: Text(method),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                makeDonationController.setDonationMethod(value);
              }
            },
          )
        : DropdownButton<String>(
            value: makeDonationController.donationMethod,
            hint: Text(
              "Select Donation Method",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            items: const ['Home pick-up', 'Drop-off donation']
                .map((method) => DropdownMenuItem(
                      value: method,
                      child: Text(method),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                makeDonationController.setDonationMethod(value);
              }
            },
          );
  }

  Widget proceedButton() {
    return ButtonWidget(
      onPressed: () {
        makeDonationController.proceedToDonationMethodDetails(context);
      },
      child: const Text("Proceed"),
    );
  }
}
