import 'donation_submitted_state.dart';
import 'donation_state.dart';

class DonationContext {
  late DonationState _state;

  DonationContext() {
    _state = DonationSubmittedState(); // Default state.
  }

  void setState(DonationState? state) {
    if (state != null) {
      _state = state;
    }
    else {
      print("State transition failed. No valid next state.");
    }
  }

  void proceedToNextState() {
    setState(_state.getNextState(this));
  }

  void revertToPreviousState() {
    setState(_state.getPreviousState());
  }

  String getStatus() {
    return _state.getStatusMessage();
  }

  void handleCurrentState() {
    _state.handleRequest(this);
  }
}
