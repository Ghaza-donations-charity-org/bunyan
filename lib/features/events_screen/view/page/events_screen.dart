// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../../common_mvc/common_controller/user_controller.dart';
// import '../../controller/events_controller.dart';
// import '../widget/event_card.dart';
//
// class EventsScreen extends StatelessWidget {
//   const EventsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => EventController()..loadEvents(), // Load events on initialization
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Events'),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.refresh),
//               onPressed: () {
//                 final controller = context.read<EventController>();
//                 controller.loadEvents(); // Refresh events
//               },
//             ),
//           ],
//         ),
//         body: Consumer<UserControllerProvider>(
//           builder: (context, controller, child) {
//             if (controller.events.isEmpty) {
//               return const Center(
//                 child: Text("No events available."),
//               );
//             }
//             return ListView.builder(
//               itemCount: controller.events.length,
//               itemBuilder: (ctx, index) {
//                 final event = controller.events[index];
//                 return EventCard(
//                   event: event,
//                   onBookmarkToggle: () => controller.toggleBookmark(event.id),
//                   onGoingToggle: () => controller.toggleGoingStatus(event.id),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common_mvc/common_controller/user_controller.dart';
import '../../controller/events_controller.dart';
import '../widget/event_card.dart';
import 'add_events.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  late EventController _eventController;

  @override
  void initState() {
    super.initState();
    // Fetch events when the screen initializes
    _eventController = context.read<EventController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _eventController.loadEvents(); // Ensure events are fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventController()..loadEvents()),
    // Ensure UserControllerProvider is properly provided
    ChangeNotifierProvider(
    create: (_) => UserControllerProvider(user: context.read<UserControllerProvider>().user)),

        // ChangeNotifierProvider(
        //   create: (_) => Provider.of<UserControllerProvider>(context, listen: false),
        // ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Events'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                final eventController = context.read<EventController>();
                eventController.loadEvents(); // Refresh events
              },
            ),
          ],
        ),
        body: Consumer2<EventController, UserControllerProvider>(
          builder: (context, eventController, userController, child) {
            if (eventController.events.isEmpty) {
              return const Center(
                child: Text("No events available."),
              );
            }
            return ListView.builder(
              itemCount: eventController.events.length,
              itemBuilder: (ctx, index) {
                final event = eventController.events[index];
                return EventCard(
                  event: event,
                  onBookmarkToggle: () async {
                    try {
                      await userController.bookmarkEvent(event.id);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  },
                  onGoingToggle: () async {
                    try {
                      await userController.attendEvent(event.id);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: ${e.toString()}')),
                      );
                    }
                  },
                );
              },
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddEventScreen()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
