Future<List<LookupItem>> getLookupItems(String collectionName) async {
  // Fetch the data from Firebase via the FirebaseHelper
  List<Map<String, dynamic>> itemsData = await firebaseHelper.getLookupItems(collectionName);

  // Map the fetched data to LookupItem objects and return as a list
  return itemsData.map((itemData) {
    return LookupItem.fromMap(itemData['id'], itemData);
  }).toList();
}
