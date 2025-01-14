import 'package:flutter/material.dart';
import 'package:your_app_name/models/lookup_item_model.dart';
import 'package:your_app_name/repositories/lookup_item_repository.dart';

class LookupItemViewModel extends ChangeNotifier {
  final LookupItemRepository repository;

  List<LookupItem> _lookupItems = [];
  List<LookupItem> get lookupItems => _lookupItems;

  LookupItemViewModel(this.repository);

  // Fetch all lookup items
  Future<void> fetchLookupItems(String collectionName) async {
    _lookupItems = await repository.getLookupItems(collectionName);
    notifyListeners();
  }

  // Add a new lookup item
  Future<void> addLookupItem(String collectionName, String name) async {
    LookupItem newItem = LookupItem(id: '', name: name);
    await repository.addLookupItem(collectionName, newItem);
    await fetchLookupItems(collectionName);
  }

  // Update an existing lookup item
  Future<void> updateLookupItem(String collectionName, String id, String name) async {
    LookupItem updatedItem = LookupItem(id: id, name: name);
    await repository.updateLookupItem(collectionName, id, updatedItem);
    await fetchLookupItems(collectionName);
  }

  // Delete a lookup item
  Future<void> deleteLookupItem(String collectionName, String id) async {
    await repository.deleteLookupItem(collectionName, id);
    await fetchLookupItems(collectionName);
  }
}
