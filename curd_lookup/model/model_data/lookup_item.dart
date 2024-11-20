class LookupItem {
  final String id;
  final String name;

  LookupItem({required this.id, required this.name});

  factory LookupItem.fromMap(String id, Map<String, dynamic> data) {
    return LookupItem(
      id: id,
      name: data['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}
