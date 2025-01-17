import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/events_controller.dart';
import '../../model/event.dart';
import '../widget/event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventController()..loadEvents(), // Load events on initialization
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                final controller = context.read<EventController>();
                controller.loadEvents(); // Refresh events
              },
            ),
          ],
        ),
        body: Consumer<EventController>(
          builder: (context, controller, child) {
            if (controller.events.isEmpty) {
              return const Center(
                child: Text("No events available."),
              );
            }
            return ListView.builder(
              itemCount: controller.events.length,
              itemBuilder: (ctx, index) {
                final event = controller.events[index];
                return EventCard(
                  event: event,
                  onBookmarkToggle: () => controller.toggleBookmark(event.id),
                  onGoingToggle: () => controller.toggleGoingStatus(event.id),
                );
              },
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     final newEvent = Event(
        //       id: "", // Leave empty as Firebase generates the ID
        //       title: "New Event",
        //       description: "Event Description",
        //       imageUrl: "https://via.placeholder.com/150",
        //     );
        //     final controller = context.read<EventController>();
        //     await controller.addEvent(newEvent); // Add a new event
        //   },
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
