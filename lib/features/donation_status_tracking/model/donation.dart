// Donation class to handle donated items
import 'donation_state.dart';

class Donation {
  final DonationState state; // Holds the current state
  final String donorName;
  final String itemDescription;
  final int quantity;
  final double weight;
  final DateTime donationDate;
  final String? notes; // Optional notes for the donation

  Donation({
    required this.state,
    required this.donorName,
    required this.itemDescription,
    required this.quantity,
    required this.weight,
    required this.donationDate,
    this.notes,
  });

  String getDonationDetails() {
    return '''
Donor: $donorName
Item: $itemDescription
Quantity: $quantity
Date: ${donationDate.toLocal()}
Notes: ${notes ?? "None"}
State: ${state.getName()}
    ''';
  }
}
