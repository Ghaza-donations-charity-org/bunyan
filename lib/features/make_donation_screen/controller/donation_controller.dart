import 'package:flutter/material.dart';

class MakeDonationController with ChangeNotifier {
  double? donationAmount;
  String? donationMethod;

  bool validateDonationAmount(String amount) {
    try {
      double parsedAmount = double.parse(amount);
      if (parsedAmount > 0) {
        donationAmount = parsedAmount;
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  void setDonationMethod(String method) {
    donationMethod = method;
    notifyListeners();
  }

  Future<void> submitDonation() async {
    if (donationAmount != null && donationMethod != null) {
      //ToDo: Implement donation submission
      debugPrint("Donation submitted: $donationAmount via $donationMethod");
    } else {
      throw Exception("Incomplete donation data");
    }
  }
}