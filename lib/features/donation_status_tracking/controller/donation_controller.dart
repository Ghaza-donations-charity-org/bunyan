import '../model/donation_context.dart';
import '../model/donation_failed.dart';
import '../model/donation_state.dart';

class DonationController {
  final DonationContext _context = DonationContext();

  // Delegate methods for state transitions
  void proceedToNextState() => _context.proceedToNextState();

  void revertToPreviousState() => _context.revertToPreviousState();

  void simulateError() {
    final currentState = _context.getCurrentState();
    _context.setState(DonationFailedState("Error in state: ${currentState.getName()}"));
  }

  // Expose the current state's status message
  String getStatusMessage() => _context.getStatus();

  DonationState getCurrentState() => _context.getCurrentState();

  int getStateIndex(DonationState state) => _context.getCurrentStateIndex(state);

  List<DonationState> getAllStates() => _context.getAllStates();

  void setCurrentState(DonationState state) => _context.setState(state);

  bool isCurrentState(DonationState state) => _context.getCurrentState().getName() == state.getName();
}
