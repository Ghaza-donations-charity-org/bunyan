Future<void> updateLookupItem(String collectionName, String id, LookupItem item) async {
  // Update the item in Firebase via FirebaseHelper
  await firebaseHelper.updateLookupItem(collectionName, id, item.toMap());
}
