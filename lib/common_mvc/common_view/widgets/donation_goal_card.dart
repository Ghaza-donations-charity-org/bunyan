import 'package:ghaza_donations_app/common_mvc/common_controller/common_utility_classes/image_utils.dart';
import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';
import 'package:flutter/material.dart';

class DonationGoalCard extends StatefulWidget {
  final DonationGoal donationGoal;
  final Function (bool selected) onSaveButtonPressed;
  const DonationGoalCard({super.key, required this.donationGoal, required this.onSaveButtonPressed});
  @override
  State<DonationGoalCard> createState() => _DonationGoalCardState();
}

class _DonationGoalCardState extends State<DonationGoalCard> {
  bool saved = false;

  @override
  void initState() {
    super.initState();
 //   saved =
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/donationGoalDetails', arguments: donationGoal);
      },

      child: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          children: [

            Stack(
          children: [
            Container(
              height: 125,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(image: ImageUtilityFunctions.getImage(widget.donationGoal.imageUrl)),
              ),
            ),
            ],),


            Container(
              height: 50,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.donationGoal.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: IconButton(
                      onPressed: () {
                        widget.onSaveButtonPressed(saved);
                      },
                      icon: saved
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
