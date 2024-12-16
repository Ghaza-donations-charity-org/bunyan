abstract class AdminOperations {
  Future<void> deleteUser(String userId);
  Future<void> addDonationGoal(Map<String, dynamic> donationData);
  Future<void> updateDonationGoal(Map<String, dynamic> donationData);
  Future<void> deleteDonationGoal(String donationId);
}