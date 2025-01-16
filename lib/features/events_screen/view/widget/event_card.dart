import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/common_mvc/common_view/theme/app_colors.dart';
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
                        event.isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: Colors.blue,
                      ),
                      onPressed: onBookmarkToggle,
                    ),
                    TextButton.icon(
                      onPressed: onGoingToggle,
                      icon: Icon(
                        event.isGoing ? Icons.check : Icons.close,
                        color: event.isGoing ? Colors.green : Colors.red,
                      ),
                      label: Text(
                        event.isGoing ? 'Going' : 'Not Going',
                        style: TextStyle(
                          color: event.isGoing ? Colors.green : Colors.red,
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
