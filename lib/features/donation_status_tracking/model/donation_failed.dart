import 'donation_context.dart';
import 'donation_state.dart';

class DonationFailedState implements DonationState {
  final String errorMessage;

  DonationFailedState(this.errorMessage);

  @override
  String getName() => "Donation Failed";

  @override
  DonationState? getNextState(DonationContext context) {
    // DonationFailedState is a terminal state unless refreshed
    print("Cannot proceed to the next state until the issue is resolved.");
    return null;
  }

  @override
  DonationState? getPreviousState() {
    print("No previous state available for DonationFailedState.");
    return null; // No previous state since it's an error state
  }

  @override
  String getStatusMessage() {
    return "An error occurred: $errorMessage. Please resolve the issue and refresh to continue.";
  }

  @override
  void handleRequest(DonationContext context) {
    print(getStatusMessage());
    print("Provide options to resolve the error or refresh the state.");
    // Display an error message and offer resolution steps in the UI
  }
}
