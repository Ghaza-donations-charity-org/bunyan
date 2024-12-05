import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_received_state.dart';
import 'donation_state.dart';

class DonationConfirmedState implements DonationState {
  @override
  void handleRequest(DonationContext context) {
    try {
      context.setState(getNextState(context));
    } catch (error) {
      context.setState(DonationFailedState("Error confirming donation: ${error.toString()}"));
    }
  }

  @override
  DonationState? getNextState(DonationContext context) {
    try {
      print("Donation Confirmed Successfully!");
      return DonationReceivedState();
    } catch (error) {
      return DonationFailedState("Error confirming donation: ${error.toString()}");
    }
  }

  @override
  DonationState? getPreviousState() => null; // No previous state for the first one.

  @override
  String getStatusMessage() => "Donation request submitted by the donor was confirmed.";

  @override
  String getName() => "Donation Confirmed";
}
