Future<void> deleteLookupItem(String collectionName, String id) async {
  // Delete the item from Firebase via FirebaseHelper
  await firebaseHelper.deleteLookupItem(collectionName, id);
}
