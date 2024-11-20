class LookupItemModel {
  final String id;
  final String name;

  LookupItemModel({required this.id, required this.name});

  factory LookupItemModel.fromMap(String id, Map<String, dynamic> map) {
    return LookupItemModel(
      id: id,
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name};
  }
}
