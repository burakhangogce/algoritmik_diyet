import 'dart:convert';

class StudentsOutputModel {
  int studentId, studentClassId, studentNumber;
  String studentName;

  StudentsOutputModel({
    required this.studentId,
    required this.studentClassId,
    required this.studentNumber,
    required this.studentName,
  });

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'studentClassId': studentClassId,
      'studentNumber': studentNumber,
      'studentName': studentName,
    };
  }

  factory StudentsOutputModel.fromMap(Map<String, dynamic> map) {
    return StudentsOutputModel(
      studentId: map['studentId'],
      studentClassId: map['studentClassId'],
      studentNumber: map['studentNumber'],
      studentName: map['studentName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentsOutputModel.fromJson(Map<String, dynamic> json) {
    return StudentsOutputModel(
      studentId: json['studentId'],
      studentClassId: json['studentClassId'],
      studentNumber: json['studentNumber'],
      studentName: json['studentName'],
    );
  }

  @override
  String toString() {
    return 'StudentsOutputModel(studentId: $studentId, studentClassId: $studentClassId, studentNumber: $studentNumber, studentName: $studentName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StudentsOutputModel &&
        other.studentId == studentId &&
        other.studentClassId == studentClassId &&
        other.studentNumber == studentNumber &&
        other.studentName == studentName;
  }

  @override
  int get hashCode {
    return studentId.hashCode ^
        studentClassId.hashCode ^
        studentNumber.hashCode ^
        studentName.hashCode;
  }
}
