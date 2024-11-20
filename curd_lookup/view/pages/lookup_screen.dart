import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_app_name/viewmodels/lookup_item_viewmodel.dart';

class LookupItemScreen extends StatelessWidget {
  final String collectionName;

  LookupItemScreen({required this.collectionName});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LookupItemViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Manage $collectionName')),
      body: FutureBuilder(
        future: viewModel.fetchLookupItems(collectionName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          return ListView.builder(
            itemCount: viewModel.lookupItems.length,
            itemBuilder: (context, index) {
              final item = viewModel.lookupItems[index];
              return ListTile(
                title: Text(item.name),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => viewModel.updateLookupItem(collectionName, item.id, 'New Name'),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => viewModel.deleteLookupItem(collectionName, item.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.addLookupItem(collectionName, 'New Category'),
        child: Icon(Icons.add),
      ),
    );
  }
}
