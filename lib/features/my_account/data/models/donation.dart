import 'package:ghaza_donations_app/features/my_account/data/models/user.dart';

// The main class representing a Donation
class Donation {
  late LogisticsEmployee logisticsEmployee;  // The employee responsible for logistics of the donation
  late DonationType donationType;            // The type of donation (monetary, item, etc.)
  late PaymentMethods paymentMethod;         // The method used for the donation (online, cash, etc.)
  late DateTime donationDate;                // Date when the donation was made
  late DonationDetails donationDetails;      // Additional details about the donation

  // Constructor to initialize the donation
  Donation({
    required this.logisticsEmployee,
    required this.donationType,
    required this.paymentMethod,
    required this.donationDate,
    required this.donationDetails,
  });

  // Method to get a summary of the donation
  String getDonationSummary() {
    return 'Donation Summary: ${donationType.getDonationDescription()}, Processed by ${logisticsEmployee.name} on $donationDate';
  }
}

// Class for additional details related to the donation
class DonationDetails {
  late double amount;              // Amount donated (for monetary donations)
  late String itemDescription;     // Description of items donated (for item donations)
  late String donorMessage;        // Optional message from the donor

  // Constructor to initialize donation details
  DonationDetails({
    required this.amount,
    required this.itemDescription,
    required this.donorMessage,
  });
}

// Abstract class representing a general donation type
abstract class DonationType {
  String getDonationDescription();  // Abstract method to describe the donation type
}

// Class for monetary donations
class MonetaryDonation implements DonationType {
  @override
  String getDonationDescription() {
    return 'Monetary donation';
  }
}

// Class to represent fundraising goals
class FundraisingGoals {
  late String goalName;           // Name of the fundraising goal
  late double targetAmount;       // Target amount for the goal

  // Constructor for fundraising goals
  FundraisingGoals({required this.goalName, required this.targetAmount});
}

// Class for item-based donations
class ItemDonation implements DonationType {
  @override
  String getDonationDescription() {
    return 'Item donation';
  }
}

// General monetary donation class with an amount
class GeneralMonetaryDonation extends MonetaryDonation {
  late double amount;  // Amount for the general monetary donation

  // Constructor to initialize the amount
  GeneralMonetaryDonation({required this.amount});

  @override
  String getDonationDescription() {
    return 'General monetary donation of \$${amount.toStringAsFixed(2)}';
  }
}

// Class for categorized monetary donations (for specific causes)
class CategorizedDonation extends GeneralMonetaryDonation {
  late String category;  // Category of the donation (e.g., Education, Health)

  // Constructor to initialize both amount and category
  CategorizedDonation({required double amount, required this.category}) : super(amount: amount);

  @override
  String getDonationDescription() {
    return 'Categorized monetary donation of \$${amount.toStringAsFixed(2)} for $category';
  }
}

// Class for unspecified monetary donations
class UnspecifiedDonation extends GeneralMonetaryDonation {
  UnspecifiedDonation({required double amount}) : super(amount: amount);

  @override
  String getDonationDescription() {
    return 'Unspecified monetary donation of \$${amount.toStringAsFixed(2)}';
  }
}

// Abstract class for payment methods (online, in-cash, etc.)
abstract class PaymentMethods {
  late String transactionId;  // Transaction ID for the payment
  late DateTime paymentDate;   // Date of payment

  // Abstract method to process the payment
  void processPayment();
}

// Class for online payment method (could be through a payment gateway)
class OnlinePayment implements PaymentMethods {
  @override
  late String transactionId;
  @override
  late DateTime paymentDate;
  late String paymentGateway;  // Payment gateway used (e.g., PayPal, Stripe)

  // Constructor to initialize the payment details
  OnlinePayment({required this.transactionId, required this.paymentDate, required this.paymentGateway});

  // Method to process the payment
  @override
  void processPayment() {
    print('Processing online payment through $paymentGateway for transaction $transactionId');
  }
}

// Class for in-cash payments
class InCashPayment implements PaymentMethods {
  @override
  late String transactionId;
  @override
  late DateTime paymentDate;

  // Constructor to initialize the cash payment
  InCashPayment({required this.transactionId, required this.paymentDate});

  // Method to process the payment
  @override
  void processPayment() {
    print('Processing in-cash payment for transaction $transactionId');
  }
}