class Exam {
  int id;
  String name;
  DateTime dateTime;
  List<String> classrooms;

  Exam({required this.id, required this.name, required this.dateTime, required this.classrooms});

  // Exam.fromJson(Map<String, dynamic> data)
  //     : id = data['id'],
  //       name = data['name'],
  //       dateTime = DateTime.parse(data['dateTime']),
  //       classrooms = List<String>.from(data['classrooms']);
  //
  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'name': name,
  //   'dateTime': dateTime.toIso8601String(),
  //   'classrooms': classrooms,
  // };
}
