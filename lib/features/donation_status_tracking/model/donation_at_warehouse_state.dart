import 'package:flutter/cupertino.dart';

import '../../../common_mvc/common_controller/user_controller.dart';
import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_finalised_state.dart';
import 'donation_received_state.dart';
import 'donation_state.dart';

class DonationAtWarehouseState implements DonationState {

  // When creating an instance of DonationAtWarehouseState, pass the required userController argument:
  //
  // final userController = UserController(); // Ensure this is initialized correctly.
  // final warehouseState = DonationAtWarehouseState(userController: userController);

  @override
  void handleRequest(DonationContext donationContext, BuildContext context) {
    donationContext.setState(getNextState(donationContext));
  }

  @override
  DonationState? getNextState(DonationContext context) {
    try {
      print("Donation arrived at warehouse Successfully!");
      return DonationFinalizedState();
    } catch (error) {
      return DonationFailedState("Error in donation arrival donation: ${error.toString()}");
    }
  }

  @override
  DonationState? getPreviousState() => DonationReceivedState();

  @override
  String getStatusMessage() => "Donation successfully arrived at the warehouse.";

  @override
  String getName() => "Donation At Warehouse";
}
