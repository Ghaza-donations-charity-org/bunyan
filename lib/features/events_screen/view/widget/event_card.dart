import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../common_mvc/common_controller/user_controller.dart';
import '../../model/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onBookmarkToggle;
  final VoidCallback onGoingToggle;

  const EventCard({
    Key? key,
    required this.event,
    required this.onBookmarkToggle,
    required this.onGoingToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserControllerProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      color: AppColors.navyBlue.withOpacity(0.7),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: AppColors.white.withOpacity(0.7), // Set the background color here
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            elevation: 5,
            child: Image.network(
              event.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  maxLines: 1,
                ),
                const SizedBox(height: 8),
                Text(
                  event.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        userController.user.bookmarkedEvents.contains(event.id)
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: Colors.blue,
                      ),
                      onPressed: onBookmarkToggle,
                    ),
                    TextButton.icon(
                      onPressed: onGoingToggle,
                      icon: Icon(
                        userController.user.eventsToAttend.contains(event.id)
                            ? Icons.check : Icons.close,
                        color: userController.user.eventsToAttend.contains(event.id) ? Colors.green : Colors.red,
                      ),
                      label: Text(
                        userController.user.eventsToAttend.contains(event.id) ? 'Going' : 'Not Going',
                        style: TextStyle(
                          color: userController.user.eventsToAttend.contains(event.id) ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}