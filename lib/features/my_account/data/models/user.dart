import 'package:ghaza_donations_app/features/my_account/data/models/donation.dart';


// Base class representing a general User
class User {
  late String id;            // Unique identifier for the user
  UserData userData;

  // Constructor to initialize user details
  User({
    required this.id,
    required this.userData,
  });
}

// Class representing additional data related to the user
class UserData {
  late String name;
  late int age;
  late String email;
  late Address address;
  late PhoneNumber phoneNumber;
  late List<String> skills;  // List of skills (for volunteers, employees, etc.)
  late String profilePicture; // URL to the user's profile picture

  // Constructor to initialize user data
  UserData({
    required this.name,
    required this.age,
    required this.email,
    required this.profilePicture,
    required this.address,
    required this.phoneNumber,
    required this.skills,
  });

}

// Class for PhoneNumber details
class PhoneNumber {
  late String userid;
  late String number;  // Phone number as a string (with country code)

  // Constructor to initialize phone number
  PhoneNumber({required this.number, required this.userid});

  // Method to validate phone number (simple validation example)
  bool isValid() {
    return number.length >= 10; // A simple check for the length of a phone number
  }
}

// Class for Address details
class Address {
  late String street;     // Street address
  late String city;       // City
  late String state;      // State or province
  late String postalCode; // Postal code
  late String country;    // Country

  // Constructor to initialize address
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
  });

  // Method to get the full address as a string
  String getFullAddress() {
    return '$street, $city, $state, $postalCode, $country';
  }
}

// Abstract class representing a UserType (to be extended by different types of users)
abstract class UserType {
  // Any common functionality for all user types can go here
  String getUserType();
}

// Refugee class implementing the UserType interface
class Refugee implements UserType {
  @override
  String getUserType() => 'Refugee';
}

// Helper class implementing the UserType interface
class Helper implements UserType {
  @override
  String getUserType() => 'Helper';
}

// Donor class, a subclass of Helper
class Donor extends Helper {
  late String donationHistory;  // List or history of donations made by the donor

  Donor({
    required String donationHistory,
  }) : super() {
    this.donationHistory = donationHistory;
  }

  // Method to get donor donation history
  String getDonationHistory() {
    return donationHistory;
  }
}

// Volunteer class, a subclass of Helper
class Volunteer extends Helper {
  late String volunteeringHistory;  // History of volunteer activities

  Volunteer({
    required String volunteeringHistory,
  }) : super() {
    this.volunteeringHistory = volunteeringHistory;
  }

  // Method to get volunteer history
  String getVolunteeringHistory() {
    return volunteeringHistory;
  }
}

// Employee class implementing the UserType interface
class Employee implements UserType {
  @override
  String getUserType() => 'Employee';

  late String employeeId;   // Unique identifier for the employee
  late String department;   // Department where the employee works
  late DateTime hiredDate;  // Date when the employee was hired

  // Constructor for employee
  Employee({
    required this.employeeId,
    required this.department,
    required this.hiredDate,
  });

  // Method to get employee details
  String getEmployeeDetails() {
    return 'Employee ID: $employeeId, Department: $department, Hired Date: $hiredDate';
  }
}

// LogisticsEmployee class, a subclass of Employee
class LogisticsEmployee extends Employee {
  late String logisticsRole;  // Role within logistics (e.g., warehouse manager, delivery coordinator)

  LogisticsEmployee({
    required String employeeId,
    required String department,
    required DateTime hiredDate,
    required this.logisticsRole,
  }) : super(employeeId: employeeId, department: department, hiredDate: hiredDate);

  // Method to get logistics employee details
  String getLogisticsEmployeeDetails() {
    return 'Logistics Role: $logisticsRole, ' + super.getEmployeeDetails();
  }
}

// Admin class, a subclass of Employee
class Admin extends Employee {
  late String adminRole;  // Role of the admin (e.g., system admin, IT admin, etc.)

  Admin({
    required String employeeId,
    required String department,
    required DateTime hiredDate,
    required this.adminRole,
  }) : super(employeeId: employeeId, department: department, hiredDate: hiredDate);

  // Method to get admin details
  String getAdminDetails() {
    return 'Admin Role: $adminRole, ' + super.getEmployeeDetails();
  }
}

// PaymentAdmin class, a subclass of Admin
class PaymentAdmin extends Admin {
  PaymentAdmin({
    required String employeeId,
    required String department,
    required DateTime hiredDate,
    required String adminRole,
  }) : super(employeeId: employeeId, department: department, hiredDate: hiredDate, adminRole: adminRole);

  // Method specific to Payment Admin
  String managePayments() {
    return 'Managing payment systems and user transactions.';
  }
}

// DonationAdmin class, a subclass of Admin
class DonationAdmin extends Admin {
  DonationAdmin({
    required String employeeId,
    required String department,
    required DateTime hiredDate,
    required String adminRole,
  }) : super(employeeId: employeeId, department: department, hiredDate: hiredDate, adminRole: adminRole);

  // Method specific to Donation Admin
  String manageDonations() {
    return 'Overseeing donation campaigns and processing donations.';
  }
}

// EventsAdmin class, a subclass of Admin
class EventsAdmin extends Admin {
  EventsAdmin({
    required String employeeId,
    required String department,
    required DateTime hiredDate,
    required String adminRole,
  }) : super(employeeId: employeeId, department: department, hiredDate: hiredDate, adminRole: adminRole);

  // Method specific to Events Admin
  String manageEvents() {
    return 'Planning and organizing events.';
  }
}

