import 'donation_approved_by_admin.dart';
import 'donation_at_warehouse_state.dart';
import 'donation_failed.dart';
import 'donation_finalised_state.dart';
import 'donation_received_state.dart';
import 'donation_state.dart';
import 'donation_submitted_state.dart';

class DonationContext {
  late DonationState _state;
  final List<DonationState> _states = [
    DonationSubmittedState(),
    DonationApprovedState(),
    DonationReceivedState(),
    DonationAtWarehouseState(),
    DonationFinalizedState(),
    DonationFailedState("Error occurred"),
  ];

  DonationContext() {
    _state = DonationSubmittedState(); // Default state.
  }
  // List of donation items
  List<DonationItem> donationItems = [];
  
  void setState(DonationState? state) {
    if (state != null) {
      _state = state;
    } else {
      print("State transition failed. No valid next state.");
    }
  }
  void proceedToNextState() {
    final nextState = _state.getNextState(this);
    if (nextState != null) {
      setState(nextState);
    } else {
      print("No next state available.");
    }
  }

  void revertToPreviousState() {
    final previousState = _state.getPreviousState();
    if (previousState != null) {
      setState(previousState);
    } else {
      print("No previous state available.");
    }
  }

  String getStatus() {
    return _state.getStatusMessage();
  }

  DonationState getCurrentState() {
    return _state;
  }

  int getCurrentStateIndex(DonationState state) {
    return _states.indexWhere((s) => s.getName() == state.getName());
  }

  List<DonationState> getAllStates() {
    return _states;
  }

  void handleCurrentState() {
    _state.handleRequest(this);
  }
}
