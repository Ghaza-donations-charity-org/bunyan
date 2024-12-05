import 'donation_context.dart';
import 'donation_failed.dart';
import 'donation_finalised_state.dart';
import 'donation_received_state.dart';
import 'donation_state.dart';

class DonationAtWarehouseState implements DonationState {
  @override
  void handleRequest(DonationContext context) {
    context.setState(getNextState(context));
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
