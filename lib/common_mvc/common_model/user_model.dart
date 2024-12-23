class User {
  int _points = 0; // Private field to store points
  // Getter for points
  int get points => _points;

  // Private setter for points
  void _setPoints(int points) {
    _points = points;
  }
}
