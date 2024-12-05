import '../model/donation_context.dart';

class DonationController {
  final DonationContext _donationContext; //uses the abstract context class methods.

  DonationController(this._donationContext);

  void proceedToNextState() {
    _donationContext.proceedToNextState();
  }

  void revertToPreviousState() {
    _donationContext.revertToPreviousState();
  }

  String getCurrentStatus() {
    return _donationContext.getStatus();
  }

  void handleCurrentState() {
    _donationContext.handleCurrentState();
  }
}
