class StudentModel {
  final int id;
  final UserId userId;
  final ClassId classId;
  final SectionId sectionId;
  final int status;
  final String created;
  final String modified;
  final StudentData data;
  final String username;
  final className;
  final String sectionName;
  final String imagePath;

  StudentModel({
    required this.id,
    required this.userId,
    required this.classId,
    required this.sectionId,
    required this.status,
    required this.created,
    required this.modified,
    required this.data,
    required this.username,
    required this.className,
    required this.sectionName,
    required this.imagePath,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
        id: json['id'],
        userId: UserId.fromJson(json['user_id']),
        classId: ClassId.fromJson(json['class_id']),
        sectionId: SectionId.fromJson(json['section_id']),
        status: json['status'],
        created: json['created'],
        modified: json['modified'],
        data: StudentData.fromJson(json['data']),
        username: json['username'],
        className: json['classname'],
        sectionName: json['section_name'],
        imagePath: json['imagepath'] ?? '');
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

class SectionId {
  final int value;
  final String label;

  SectionId({required this.value, required this.label});

  factory SectionId.fromJson(Map<String, dynamic> json) {
    return SectionId(
      value: json['value'],
      label: json['label'],
    );
  }
}

class StudentData {
  final String dob;
  final String name;
  final String address;
  final String bloodGroup;
  final String fatherName;
  final String motherName;
  final contact;
  final roleNo;

  StudentData({
    required this.dob,
    required this.name,
    required this.address,
    required this.bloodGroup,
    required this.fatherName,
    required this.motherName,
    required this.contact,
    required this.roleNo,
  });

  factory StudentData.fromJson(Map<String, dynamic> json) {
    return StudentData(
        dob: json['dob'],
        name: json['name'],
        address: json['address'],
        bloodGroup: json['bloodgroup'],
        fatherName: json['fathername'],
        motherName: json['mothername'] ?? '',
        contact: json['contact'] ?? '',
        roleNo: json['role_no'] ?? 'No Role Number');
  }
}
