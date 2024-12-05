import 'donation_at_warehouse_state.dart';
import 'donation_confirmed_state.dart';
import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_state.dart';

class DonationReceivedState implements DonationState {
  @override
  void handleRequest(DonationContext context) {
    context.setState(getNextState(context));
  }

  @override
  DonationState? getNextState(DonationContext context) {
    try {
      print("Donation received Successfully!");
      return DonationAtWarehouseState();
    } catch (error) {
      return DonationFailedState("Error receiving donation: ${error.toString()}");
    }
  }

  @override
  DonationState? getPreviousState() => DonationConfirmedState();

  @override
  String getStatusMessage() => "Donation received from the donor by our delivery services.";

  @override
  String getName() => "Donation Received";
}
