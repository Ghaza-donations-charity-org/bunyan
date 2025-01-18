import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';
import 'package:ghaza_donations_app/features/make_donation_screen/view/page/drop_off_locations.dart';
import 'package:ghaza_donations_app/features/make_donation_screen/view/page/online_payment.dart';

import '../view/page/donation_address_screen.dart';

class MakeDonationController with ChangeNotifier {
  DonationGoal? donationGoal;
  double? donationAmount;
  String? donationMethod;
  String? donationAddress;
  String? cardNumber;
  String? expiryDate;
  String? cvv;

  void setPaymentInfo(
      {required String cardNumber,
      required String expiryDate,
      required String cvv}) {
    this.cardNumber = cardNumber;
    this.expiryDate = expiryDate;
    this.cvv = cvv;
    notifyListeners();
  }

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

  void setDonationAmount(String amount) {
    donationAmount = double.parse(amount);
    notifyListeners();
  }

  void setDonationGoal(DonationGoal goal) {
    donationGoal = goal;
    notifyListeners();
  }

  void setDonationMethod(String method) {
    donationMethod = method;
    notifyListeners();
  }

  void setPickUpLocation(String address) {
    donationAddress = address;
    notifyListeners();
  }

  void proceedToDonationMethodDetails(BuildContext context) {
    if (donationAmount != null && donationMethod == 'Online payment') {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const OnlinePaymentScreen()));
    } else if (donationAmount != null && donationMethod == 'Home pick-up') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const DonationAddressScreen()));
    } else if (donationAmount != null &&
        donationMethod == 'Drop-off donation') {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const DropOffLocations()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Please enter a valid donation amount"),
      ));
    }
  }

  void validatePaymentInfo(
      {required String cardNumber,
      required String expiryDate,
      required String cvv}) {
    if (cardNumber.length == 16 && expiryDate.length == 5 && cvv.length == 3) {
      return;
    } else {
      throw Exception("Invalid payment information");
    }
  }

  void validatePickUpLocation() {
    if (donationAddress!= null && donationAddress!.isNotEmpty) {
      return;
    } else {
      throw Exception("Invalid pick-up location");
    }
  }

  void validateDonationData(){
    if(donationAmount != null && donationMethod != null){
      if(donationMethod == 'Home pick-up'){
        validatePickUpLocation();
      }else if(donationMethod == 'Online payment'){
        validatePaymentInfo(cardNumber: cardNumber!, expiryDate: expiryDate!, cvv: cvv!);
      }
      else if(donationMethod == 'Drop-off donation'){
        return ;
      }
    }else{
      throw Exception("Incomplete donation data");
    }
  }

  Future<void> submitDonation({required BuildContext context}) async {
    if (donationAmount != null && donationMethod != null) {
      try {
        validateDonationData();
        //ToDo: Submit donation
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text("Donation submitted: $donationAmount via $donationMethod"),
        ));

        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Invalid payment information"),
        ));
      }
    } else {
      throw Exception("Incomplete donation data");
    }
  }
}
