import 'firebase_models/firebase_facade.dart';

class DonationGoal {
  final String? id;
  final String title;
  final String description;
  final double targetAmount;
  final double currentAmount;
  final String unit;
  final String? imageUrl;


  DonationGoal({
    this.id,
    required this.title,
    required this.description,
    required this.targetAmount,
    required this.currentAmount,
    required this.unit,
    this.imageUrl,
  });

  double getProgressPercentage() {
    return currentAmount / targetAmount;
  }

  String getProgress() {
    return "${currentAmount.toInt()} / ${targetAmount.toInt()} $unit";
  }

  String getProgressPercentageAsString() {
    return "${(getProgressPercentage() * 100).toStringAsFixed(2)}%";
  }

  factory DonationGoal.fromMap(Map<String, dynamic> map) {
    return DonationGoal(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      targetAmount: map['targetAmount'],
      currentAmount: map['currentAmount'],
      unit: map['unit'],
      imageUrl: map['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'targetAmount': targetAmount,
      'currentAmount': currentAmount,
      'unit': unit,
      'imageUrl': imageUrl,
    };
  }
  // CRUD Operations
  static Future<void> addDonationGoal(DonationGoal goal) async {
    final facade = FirebaseFacade();
    await facade.saveDataToFirestore('donationGoals', goal.toMap());
  }

  static Future<List<DonationGoal>> getAllDonationGoals() async {
    final facade = FirebaseFacade();
    final data = await facade.getDataFromFirestore('donationGoals');
    return data.map((doc) => DonationGoal.fromMap(doc)).toList();
  }

  static Future<void> updateDonationGoal(DonationGoal goal) async {
    final facade = FirebaseFacade();
    if (goal.id == null) {
      throw ArgumentError("No DonationGoal exists with this ID");
    }
    await facade.updateDocumentInFirestore('donationGoals', goal.id!, goal.toMap());
  }

  static Future<void> deleteDonationGoal(String id) async {
    final facade = FirebaseFacade();
    await facade.deleteDocumentFromFirestore('donationGoals', id);
  }

  static Future<DonationGoal?> getDonationGoalById(String id) async {
    final facade = FirebaseFacade();
    final data = await facade.getDocumentByIdFromFirestore('donationGoals', id);
    return data != null ? DonationGoal.fromMap(data) : null;
  }
}