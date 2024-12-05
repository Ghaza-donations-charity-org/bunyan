import 'donation_context.dart';

abstract class DonationState {
  void handleRequest(DonationContext context);
  DonationState? getNextState(DonationContext context); // Include DonationContext as a parameter.
  DonationState? getPreviousState();
  String getStatusMessage();
  String getName();
}
