import 'package:flutter/src/widgets/framework.dart';

import 'donation_context.dart';

abstract class DonationState {
  void handleRequest(DonationContext donationContext, BuildContext context);
  DonationState? getNextState(DonationContext context); // Include DonationContext as a parameter.
  DonationState? getPreviousState();
  String getStatusMessage();
  String getName();
}
