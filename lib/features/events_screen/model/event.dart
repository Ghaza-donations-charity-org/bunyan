class Event {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  bool isBookmarked;
  bool isGoing;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.isBookmarked = false,
    this.isGoing = false,
  });

  void toggleBookmark() {
    isBookmarked = !isBookmarked;
  }

  void toggleGoingStatus() {
    isGoing = !isGoing;
  }
}
