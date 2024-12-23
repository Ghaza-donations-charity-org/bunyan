import 'package:ghaza_donations_app/features/donation_status_tracking/model/donation_approved_by_admin.dart';

import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_state.dart';

class DonationSubmittedState implements DonationState {
  @override
  void handleRequest(DonationContext context) {
    try {
      context.setState(getNextState(context));
    } catch (error) {
      context.setState(DonationFailedState("Error submitting donation: ${error.toString()}"));
    }
  }

  @override
  DonationState? getNextState(DonationContext context) {
    try {
      print("Donation Submitted Successfully!");
      return DonationApprovedState();
    } catch (error) {
      return DonationFailedState("Error submitting donation: ${error.toString()}");
    }
  }

  @override
  DonationState? getPreviousState() => null; // No previous state for the first one.

  @override
  String getStatusMessage() => "Donation request by the donor was submitted.";

  @override
  String getName() => "Donation Submitted";
}
