class ClassesModel {
  int id;
  String name;
  UserId user;
  ClassId classInfo;
  String created;
  String modified;

  ClassesModel({
    required this.id,
    required this.name,
    required this.user,
    required this.classInfo,
    required this.created,
    required this.modified,
  });

  factory ClassesModel.fromJson(Map<String, dynamic> json) {
    return ClassesModel(
      id: json['id'],
      name: json['name'],
      user: UserId.fromJson(json['user_id']),
      classInfo: ClassId.fromJson(json['class_id']),
      created: json['created'],
      modified: json['modified'],
    );
  }
}

class UserId {
  int value;
  String label;

  UserId({required this.value, required this.label});

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      value: json['value'],
      label: json['label'],
    );
  }
}

class ClassId {
  int value;
  String label;

  ClassId({required this.value, required this.label});

  factory ClassId.fromJson(Map<String, dynamic> json) {
    return ClassId(
      value: json['value'],
      label: json['label'],
    );
  }
}
