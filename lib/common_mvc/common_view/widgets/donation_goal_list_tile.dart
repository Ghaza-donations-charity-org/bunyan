import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/image_utils.dart';
import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DonationGoalListTile extends StatefulWidget {
  final DonationGoal donationGoal;
  final Function(bool selected) onSaveButtonPressed;
  const DonationGoalListTile({super.key, required this.donationGoal,
    required this.onSaveButtonPressed});

  @override
  State<DonationGoalListTile> createState() => _DonationGoalListTileState();
}

class _DonationGoalListTileState extends State<DonationGoalListTile> {
  bool saved = false;

  @override
  void initState() {
    super.initState();
    //   saved =
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          // Navigator.pushNamed(context, '/donationGoalDetails', arguments: donationGoal);
        },
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.cardColor,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  image(),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: saveButton(),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    title(),
                    const SizedBox(height: 10),
                    progress(),
                    const SizedBox(height: 5),
                    progressBar(),
                    const SizedBox(height: 10),
                    description(),
                    const SizedBox(height: 10),
                  ],
                ),
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
          widget.onSaveButtonPressed(saved);
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
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
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
        maxLines: 2,
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
}
