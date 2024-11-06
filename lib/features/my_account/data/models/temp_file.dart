class Org {
  String orgId;
  List<String> employeesIds;
  List<Event> upcomingEvents;

  Org(this.orgId, this.employeesIds, this.upcomingEvents);
}

class Donation {
  String donationId;
  DonationType donationType;
  DateTime createdAt;
  String userId;
  String orgId;
  String warehouseId;
  String status;

  Donation(this.donationId, this.donationType, this.createdAt, this.userId, this.orgId, this.warehouseId, this.status);
}

abstract class ValidationHandler {
  ValidationHandler? next;

  void validate(Donation donation);
}

abstract class Role {
  List<String> viewTasks(String userId);
}

class Admin implements Role {
  void createBadge() {}
  void deleteBadge(String badgeId) {}
  void updateBadge(String badgeId) {}
  void createPaymentMethod() {}
  void deletePaymentMethod(String id) {}
  void updatePaymentMethod(String id) {}
  void updateDonationStatus() {}
  void deleteOrDeactivateAccounts() {}
  void createDonationOptions() {}
  void createAddOns() {}
  void deleteAddOns(String id) {}
  void updateAddOns(String id) {}
  void createDonationGoals() {}
  void deleteDonationGoals(String id) {}
  void updateDonationGoals(String id) {}
  void createDonationCategories() {}
  void updateDonationCategories(String id) {}
  void deleteDonationCategories(String id) {}
  void createDonationOrgs() {}
  void updateDonationOrgs(String id) {}
  void deleteDonationOrgs(String id) {}
  void createDropOffLocations() {}
  void updateDropOffLocations(String id) {}
  void deleteDropOffLocations(String id) {}
  void createVolunteeringOpportunities() {}
  void updateVolunteeringOpportunities(String id) {}
  void deleteVolunteeringOpportunities(String id) {}
  void reviewDonationOptions() {}
  void assignTask(String userId, String task) {}

  @override
  List<String> viewTasks(String userId) {
    return []; // Implementation
  }
}

class LogisticsEmployee implements Role {
  String vehicle;

  LogisticsEmployee(this.vehicle);

  void manageVehicle() {}

  @override
  List<String> viewTasks(String userId) {
    return []; // Implementation
  }
}

class Event {
  String eventId;
  String address;
  DateTime startDate;
  double duration;
  String eventType;

  Event(this.eventId, this.address, this.startDate, this.duration, this.eventType);
}

class DonatedItem {
  String donatedItemId;
  String name;
  String description;
  double weight;
  String size;
  String shipmentSize;
  String imageUrl;

  DonatedItem(this.donatedItemId, this.name, this.description, this.weight, this.size, this.shipmentSize, this.imageUrl);
}

abstract class DonationTypeStrategy {
  void handleDonation(Donation donation);
}

class MonetaryDonationStrategy implements DonationTypeStrategy {
  double amount;

  MonetaryDonationStrategy(this.amount);

  @override
  void handleDonation(Donation donation) {}
}

class ItemDonationStrategy implements DonationTypeStrategy {
  int quantity;
  List<DonatedItem> donatedItems;

  ItemDonationStrategy(this.quantity, this.donatedItems);

  @override
  void handleDonation(Donation donation) {}
}

class DonationGoal {
  String goalId;
  int goal;
  DonationType donationType;

  DonationGoal(this.goalId, this.goal, this.donationType);
}

class User {
  String name;
  String userId;
  String email;
  String password;
  String phoneNumber;
  String address;
  int age;
  String profilePic;

  User(this.name, this.userId, this.email, this.password, this.phoneNumber, this.address, this.age, this.profilePic);

  String get getName => name;
  set setName(String name) => this.name = name;

  String get getUserId => userId;
  set setUserId(String userId) => this.userId = userId;

  String get getEmail => email;
  set setEmail(String email) => this.email = email;

  String get getPassword => password;
  set setPassword(String password) => this.password = password;

  String get getPhoneNumber => phoneNumber;
  set setPhoneNumber(String phoneNumber) => this.phoneNumber = phoneNumber;

  String get getAddress => address;
  set setAddress(String address) => this.address = address;

  int get getAge => age;
  set setAge(int age) => this.age = age;

  String get getProfilePic => profilePic;
  set setProfilePic(String profilePic) => this.profilePic = profilePic;
}

class Donor extends User {
  String paymentOptionData;
  int donationPoints;
  List<Donation> donationHistory;
  List<DonationGoal> wishList;
  List<Badge> donorBadges;

  Donor(String name, String userId, String email, String password, String phoneNumber, String address, int age, String profilePic,
      this.paymentOptionData, this.donationPoints, this.donationHistory, this.wishList, this.donorBadges)
      : super(name, userId, email, password, phoneNumber, address, age, profilePic);

  void makeDonation(Donation donation) {}

  List<Badge> getBadge() => donorBadges;
  List<Donation> getDonationHistory() => donationHistory;
  List<DonationGoal> getWishList() => wishList;

  void deleteDonationGoal(String id) {}
  void addDonationGoal(String id) {}

  void setBadge(List<Badge> badges) => donorBadges = badges;
  void setDonationHistory(List<Donation> history) => donationHistory = history;
  void setWishList(List<DonationGoal> goals) => wishList = goals;
}

class Refugee extends User {
  String gender;
  bool accessibilityAccommodation;
  List<String> accessibility;
  String? portfolioUrl;

  Refugee(String name, String userId, String email, String password, String phoneNumber, String address, int age, String profilePic,
      this.gender, this.accessibilityAccommodation, this.accessibility, [this.portfolioUrl])
      : super(name, userId, email, password, phoneNumber, address, age, profilePic);

  String get getGender => gender;
  bool get getAccessibilityAccommodation => accessibilityAccommodation;
  List<String> get getAccessibility => accessibility;
  String? get getPortfolioUrl => portfolioUrl;

  set setGender(String gender) => this.gender = gender;
  set setAccessibilityAccommodation(bool need) => accessibilityAccommodation = need;
  set setAccessibility(List<String> accessibility) => this.accessibility = accessibility;
  set setPortfolioUrl(String? url) => portfolioUrl = url;
}

class Badge {
  String badgeId;
  String badgeName;
  int badgeMinPoints;
  String iconUrl;

  Badge(this.badgeId, this.badgeName, this.badgeMinPoints, this.iconUrl);
}

class Disability {
  String disabilityId;
  String disabilityType;
  String description;
  DisabilityAccommodation? requiredAccommodation;

  Disability(this.disabilityId, this.disabilityType, this.description, [this.requiredAccommodation]);

  void requestAccommodation(DisabilityAccommodation accommodation) {}
}

class DisabilityAccommodation {
  String accommodationId;
  String accommodationType;
  String description;

  DisabilityAccommodation(this.accommodationId, this.accommodationType, this.description);
}

class DonationRequest {
  String goalId;
  int goal;
  DonationType donationType;

  DonationRequest(this.goalId, this.goal, this.donationType);
}

class Employee {
  String role;
  String employeeId;

  Employee(this.role, this.employeeId);
}
