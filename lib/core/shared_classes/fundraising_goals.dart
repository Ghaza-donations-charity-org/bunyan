class FundraisingGoals {
  String _id;
  double _neededAmount;
  double _currentlyCollectedAmount;
  String _picture;

  // Constructor
  FundraisingGoals(this._id, this._neededAmount, this._currentlyCollectedAmount,
      this._picture);

  // Getters
  String get id => _id;
  double get neededAmount => _neededAmount;
  double get currentlyCollectedAmount => _currentlyCollectedAmount;
  String get picture => _picture;

  // Setters
  set id(String id) => _id = id;
  set neededAmount(double neededAmount) => _neededAmount = neededAmount;
  set currentlyCollectedAmount(double currentlyCollectedAmount) =>
      _currentlyCollectedAmount = currentlyCollectedAmount;
  set picture(String picture) => _picture = picture;

  // Method to provide a string representation of the campaign
  @override
  String toString() {
    return 'FundraisingCampaign(id: $_id, neededAmount: $_neededAmount, currentlyCollectedAmount: $_currentlyCollectedAmount, picture: $_picture)';
  }
}
