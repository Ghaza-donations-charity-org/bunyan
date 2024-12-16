import 'admin_operations_interface.dart';

class AdminProxy implements AdminOperations {
  final AdminOperations _realAdminOperations;
  final bool _isAdmin;

  AdminProxy(this._realAdminOperations, this._isAdmin);

  void _ensureAdminAccess() {
    if (!_isAdmin) {
      throw Exception('Access Denied: Admin privileges required.');
    }
  }

  @override
  Future<void> deleteUser(String userId) async {
    _ensureAdminAccess();
    await _realAdminOperations.deleteUser(userId);
  }

  @override
  Future<void> addDonationGoal(Map<String, dynamic> donationData) async {
    _ensureAdminAccess();
    await _realAdminOperations.addDonationGoal(donationData);
  }



  @override
  Future<void> deleteDonationGoal(String donationId) {
    // TODO: implement deleteDonation
    throw UnimplementedError();
  }

  @override
  Future<void> updateDonationGoal(Map<String, dynamic> donationData) {
    // TODO: implement updateDonation
    throw UnimplementedError();
  }
}