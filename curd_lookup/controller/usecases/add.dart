Future<void> addLookupItem(String collectionName, LookupItem item) async {
  // Add the new item to Firebase via FirebaseHelper
  await firebaseHelper.addLookupItem(collectionName, item.toMap());
}
