class User {
  int _points = 0; // Private field to store points
  // Getter for points
  int get points => _points;

  // Private setter for points
  void _setPoints(int points) {
    _points = points;
  }

  // Example logic to check if the verifier is valid
  bool _isAdmin(String verifier) {
//TODO: This could be a part of the protection proxy? like this can call a function men henak to check for credentials or validity.
    return verifier == "admin_token";
  }


}
