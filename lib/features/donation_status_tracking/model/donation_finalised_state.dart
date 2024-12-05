import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_state.dart';
import 'donation_at_warehouse_state.dart';

class DonationFinalizedState implements DonationState {
  @override
  void handleRequest(DonationContext context) {
    print("Adding user points and finalizing donation...");
  }

  @override
  DonationState? getNextState(DonationContext context) {
    try {
      print("Donation finalised Successfully!");
      return null;
    } catch (error) {
      return DonationFailedState("Error finalising donation: ${error.toString()}");
    }
  }

  @override
  String getStatusMessage() => "Donation finalized, and donor points have been added.";

  @override
  String getName() => "Donation Finalized";

  @override
  DonationState? getPreviousState() => DonationAtWarehouseState();
}
