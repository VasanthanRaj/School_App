class SectionModel {
  final int id;
  final String name;
  final ClassId classId;
  final UserId userId;
  final int status;
  final String created;
  final String modified;
  final int userIdValue;
  final String username;
  final int classIdValue;
  final String className;

  SectionModel({
    required this.id,
    required this.name,
    required this.classId,
    required this.userId,
    required this.status,
    required this.created,
    required this.modified,
    required this.userIdValue,
    required this.username,
    required this.classIdValue,
    required this.className,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'],
      name: json['name'],
      classId: ClassId.fromJson(json['class_id']),
      userId: UserId.fromJson(json['user_id']),
      status: json['status'],
      created: json['created'],
      modified: json['modified'],
      userIdValue: json['userid'],
      username: json['username'],
      classIdValue: json['classid'],
      className: json['classname'],
    );
  }
}

class ClassId {
  final int value;
  final String label;

  ClassId({required this.value, required this.label});

  factory ClassId.fromJson(Map<String, dynamic> json) {
    return ClassId(
      value: json['value'],
      label: json['label'],
    );
  }
}

class UserId {
  final int value;
  final String label;

  UserId({required this.value, required this.label});

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      value: json['value'],
      label: json['label'],
    );
  }
}
