import 'package:ghaza_donations_app/features/donation_status_tracking/model/donation_approved_by_admin.dart';

import '../../../common_mvc/common_controller/user_controller.dart';
import 'donation_at_warehouse_state.dart';
import 'donation_submitted_state.dart';
import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_state.dart';

class DonationReceivedState implements DonationState {
  final UserController? userController;

  DonationReceivedState({this.userController});
  @override
  void handleRequest(DonationContext context) {
    context.setState(getNextState(context));
  }

  @override
  DonationState? getNextState(DonationContext context) {
    try {
      print("Donation received Successfully!");
      return DonationAtWarehouseState(userController: null);
    } catch (error) {
      return DonationFailedState("Error receiving donation: ${error.toString()}");
    }
  }

  @override
  DonationState? getPreviousState() => DonationApprovedState();

  @override
  String getStatusMessage() => "Donation received from the donor by our delivery services.";

  @override
  String getName() => "Donation Received";
}
