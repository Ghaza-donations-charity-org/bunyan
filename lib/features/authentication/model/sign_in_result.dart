class FirebaseAuthResult {
  final bool success;
  final String? errorMessage;
  final bool isAdmin;

  FirebaseAuthResult({required this.success, this.isAdmin = false, this.errorMessage});
}
