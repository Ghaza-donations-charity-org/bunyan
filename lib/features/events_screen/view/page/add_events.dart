import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/events_controller.dart';
import '../../model/event.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  void _addEvent(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final newEvent = Event(
        title: _titleController.text,
        description: _descriptionController.text,
        imageUrl: _imageUrlController.text,
        isBookmarked: false,
        isGoing: false, id: '',
      );

      // Access EventController using Provider
      Provider.of<EventController>(context, listen: false).addEvent(newEvent);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Event added successfully!')),
      );

      // Clear fields
      _titleController.clear();
      _descriptionController.clear();
      _imageUrlController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Event Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Event Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _addEvent(context),
                child: const Text('Add Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
