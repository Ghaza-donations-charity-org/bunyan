import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../common_mvc/common_controller/user_controller.dart';
import '../../../common_mvc/common_model/user_model.dart';
import 'donation_approved_by_admin.dart';
import 'donation_at_warehouse_state.dart';
import 'donation_failed.dart';
import 'donation_finalised_state.dart';
import 'donation_items/donation_item.dart';
import 'donation_items/predefined_donation_items_list.dart';
import 'donation_received_state.dart';
import 'donation_state.dart';
import 'donation_submitted_state.dart';

class DonationContext {
  late DonationState _state;
  late final List<DonationState> _states;

  DonationContext(UserModel user) {
    _states = [
      DonationSubmittedState(),
      DonationApprovedState(),
      DonationReceivedState(),
      DonationAtWarehouseState(),
      DonationFinalizedState(),
      DonationFailedState("Error occurred"),
    ];
    _state = _states.first; // Default state.
  }

  // List of donation items
  List<DonationItem> userSelectedItems = [];

  // Add a donation item by category
  void addDonationCategory(String categoryName) {
    var predefinedItem = PredefinedDonationItems.findItemByName(categoryName);
    if (predefinedItem != null) {
      userSelectedItems.add(predefinedItem);
      print(
          "Added predefined donation item: ${predefinedItem.name} with ${predefinedItem.points} points.");
    } else {
      userSelectedItems.add(DonationItem(name: categoryName, points: 0));
      print(
          "Added custom donation item: $categoryName. Points pending admin allocation.");
    }
  }

  // Process points in the finalized state
  void processPoints(BuildContext context) {
    final userController = Provider.of<UserControllerProvider>(context);
    for (var item in userSelectedItems) {
      if (item.points > 0) {
        userController.autoUpdatePoints(item.points, "autoTriggerKey");
        print("Automatically added ${item.points} points for ${item.name}.");
      } else {
        print(
            "Pending points allocation for custom donation item: ${item.name}.");
      }
    }
  }

  // Removes a donation item from the context
  void removeDonationItem(DonationItem item) {
    userSelectedItems.remove(item);
    print("Removed donation item: ${item.name}.");
  }

  // Clears all donation items from the context
  void clearDonationItems() {
    userSelectedItems.clear();
    print("All donation items cleared.");
  }

  void setState(DonationState? state) {
    if (state != null) {
      _state = state;
    } else {
      print("State transition failed. State is null.");
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
    return _states.indexWhere((s) => s.getName() == _state.getName());
  }

  List<DonationState> getAllStates() {
    return _states;
  }

  void handleCurrentState(BuildContext context) {
    _state.handleRequest(this, context);
  }
}
