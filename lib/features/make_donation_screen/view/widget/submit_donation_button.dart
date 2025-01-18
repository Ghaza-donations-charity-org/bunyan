import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/buttons/button_widget.dart';
import 'package:ghaza_donations_app/features/make_donation_screen/controller/donation_controller.dart';
import 'package:provider/provider.dart';

class SubmitDonationButton extends StatefulWidget {
  final Function? onPressed;
  const SubmitDonationButton({super.key, this.onPressed});

  @override
  State<SubmitDonationButton> createState() => _SubmitDonationButtonState();
}

class _SubmitDonationButtonState extends State<SubmitDonationButton> {
  late final MakeDonationController makeDonationController;

  @override
  void initState() {
    makeDonationController = Provider.of<MakeDonationController>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ButtonWidget(
      onPressed: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
        makeDonationController.submitDonation(context: context);
      },
      text: 'Submit Donation',
    );
  }
}
