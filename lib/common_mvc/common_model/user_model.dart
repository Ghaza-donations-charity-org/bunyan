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
  // Method to manipulate points, restricted by a verifier
  void manipulatePoints(int amount, String verifier) {
    if (_isAdmin(verifier)) {
      _setPoints(_points + amount);
    } else {
      throw Exception("Unauthorized access to manipulate points.");
    }
  }

  // Method for automatic updates, restricted by an authorization key
  void autoUpdatePoints(int amount, String triggerKey) {
    // Replace "autoTriggerKey" with your actual authorization key for external logic
    if (triggerKey == "autoTriggerKey") {
      _setPoints(_points + amount);
    } else {
      throw Exception("Unauthorized access to auto-update points.");
    }
  }
}
