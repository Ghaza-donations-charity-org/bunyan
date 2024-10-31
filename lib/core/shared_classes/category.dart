class Category {
  String _id;
  String _title;
  List<String> _fundraisingGoals;

  // Constructor
  Category({
    required String id,
    required String title,
    List<String>? fundraisingGoals,
  })  : _id = id,
        _title = title,
        _fundraisingGoals = fundraisingGoals ?? [];

  // Getters
  String get id => _id;
  String get title => _title;
  List<String> get fundraisingGoals => _fundraisingGoals;

  // Setters
  set id(String id) => _id = id;
  set title(String title) => _title = title;
  set fundraisingGoals(List<String> goals) => _fundraisingGoals = goals;

  // Function to add a fundraising goal
  void addFundraisingGoal(String goal) {
    _fundraisingGoals.add(goal);
  }

  // Function to display fundraising goals
  void displayFundraisingGoals() {
    if (_fundraisingGoals.isEmpty) {
      print('No fundraising goals for this category.');
    } else {
      print('Fundraising Goals for $_title:');
      for (var goal in _fundraisingGoals) {
        print('- $goal');
      }
    }
  }

  // Method to provide a string representation of the category
  @override
  String toString() {
    return 'FundraisingCategory(id: $_id, title: $_title, goals: $_fundraisingGoals)';
  }
}
