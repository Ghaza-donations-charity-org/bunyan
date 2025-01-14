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
    return "$currentAmount / $targetAmount $unit";
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

}