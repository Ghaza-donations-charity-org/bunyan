import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_state.dart';
import 'donation_at_warehouse_state.dart';

class DonationFinalizedState implements DonationState {
  final bool isSuccessful;

  DonationFinalizedState({this.isSuccessful = false}); // Default value ensures no null values.

  @override
  void handleRequest(DonationContext context) {
    if (isSuccessful) {
      print("Donation successfully finalized, and user points added.");
    } else {
      print("Finalizing donation...");
    }
  }

  @override
  DonationState? getNextState(DonationContext context) {
    if (isSuccessful) {
      print("Donation finalized successfully!");
      return null; // No further state after success
    } else {
      // Simulate a failure for demonstration purposes
      return DonationFailedState("Error finalizing donation.");
    }
  }

  @override
  String getStatusMessage() {
    return isSuccessful
        ? "Donation successfully finalized, and donor points have been added."
        : "Finalizing donation...";
  }

  @override
  String getName() => "Donation Finalized";

  @override
  DonationState? getPreviousState() => DonationAtWarehouseState();
}
