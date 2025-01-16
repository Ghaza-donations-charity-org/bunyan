import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/event_controller.dart';
import '../widget/event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventController(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
        ),
        body: Consumer<EventController>(
          builder: (context, controller, child) {
            final events = controller.events;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (ctx, index) {
                final event = events[index];
                return EventCard(
                  event: event,
                  onBookmarkToggle: () => controller.toggleBookmark(event.id),
                  onGoingToggle: () => controller.toggleGoingStatus(event.id),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
