// ignore: file_names
class PlayerModel {
  String id;
  String name;

  PlayerModel({
    required this.id,
    required this.name,
  });
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      id: map['id'],
      name: map['name'],
    );
  }
}
