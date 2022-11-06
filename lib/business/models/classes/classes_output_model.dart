import 'dart:convert';

class ClassesOutputModel {
  int classId, classTeacherId, classLevel;
  String className;

  ClassesOutputModel({
    required this.classId,
    required this.classTeacherId,
    required this.classLevel,
    required this.className,
  });

  Map<String, dynamic> toMap() {
    return {
      'classId': classId,
      'classTeacherId': classTeacherId,
      'classLevel': classLevel,
      'className': className,
    };
  }

  factory ClassesOutputModel.fromMap(Map<String, dynamic> map) {
    return ClassesOutputModel(
      classId: map['classId'],
      classTeacherId: map['classTeacherId'],
      classLevel: map['classLevel'],
      className: map['className'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassesOutputModel.fromJson(Map<String, dynamic> json) {
    return ClassesOutputModel(
      classId: json['classId'],
      classTeacherId: json['classTeacherId'],
      classLevel: json['classLevel'],
      className: json['className'],
    );
  }

  @override
  String toString() {
    return 'StudentsOutputModel(classId: $classId, classTeacherId: $classTeacherId, classLevel: $classLevel, className: $className)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassesOutputModel &&
        other.classId == classId &&
        other.classTeacherId == classTeacherId &&
        other.classLevel == classLevel &&
        other.className == className;
  }

  @override
  int get hashCode {
    return classId.hashCode ^
        classTeacherId.hashCode ^
        classLevel.hashCode ^
        className.hashCode;
  }
}
