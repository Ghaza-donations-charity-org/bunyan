import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/image_utils.dart';
import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/widgets/buttons/button_widget.dart';

import '../../../../common_mvc/common_view/theme/app_colors.dart';
import '../../../make_donation_screen/view/page/make_donation_screen.dart';

class DonationGoalDetailsScreen extends StatefulWidget {
  final DonationGoal donationGoal;
  const DonationGoalDetailsScreen({super.key, required this.donationGoal});

  @override
  State<DonationGoalDetailsScreen> createState() =>
      _DonationGoalDetailsScreenState();
}

class _DonationGoalDetailsScreenState extends State<DonationGoalDetailsScreen> {
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.donationGoal.title),
        actions: [saveButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              image(),
              const SizedBox(
                height: 20,
              ),
              title(),
              const SizedBox(
                height: 20,
              ),
              description(),
              const SizedBox(
                height: 20,
              ),
              progress(),
              const SizedBox(
                height: 20,
              ),
              progressBar(),
              const SizedBox(
                height: 60,
              ),
              makeDonationButton(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //========================================================================//
  //=============================== Save Button =============================//
  Widget saveButton() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.scaffoldBackgroundColor.withOpacity(0.9)),
      child: IconButton(
        onPressed: () {
          setState(() {
            saved = !saved;
          });
        },
        icon: saved
            ? const Icon(
                Icons.bookmark,
                color: Colors.amber,
              )
            : const Icon(
                Icons.bookmark_border_outlined,
                color: Colors.white,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        widget.donationGoal.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.brightTextColor,
        ),
      ),
    );
  }

  //========================================================================//
  //=========================== Description ===============================//
  Widget description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        widget.donationGoal.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.brightTextColor,
        ),
      ),
    );
  }

  //========================================================================//
  //=========================== Progress ===============================//
  Widget progress() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        "collected: ${widget.donationGoal.getProgress()}",
        style: const TextStyle(
          fontSize: 16,
          color: AppColors.brightTextColor,
        ),
      ),
    );
  }

  //========================================================================//
  //=========================== Progress Bar ===============================//
  Widget progressBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Container(
            height: 7,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.grey,
            ),
          ),
          Container(
            height: 7,
            width: 250 * widget.donationGoal.getProgressPercentage(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.accentColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget makeDonationButton() {
    return ButtonWidget(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                MakeDonationScreen(donationGoal: widget.donationGoal)));
      },
      text: 'Make a donation',
    );
  }
}
