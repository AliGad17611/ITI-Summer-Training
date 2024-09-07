import 'subject.dart';

class Student {
  String name;
  int age;
  List<Subject> subjects;
  Student({
    required this.name,
    required this.age,
    required this.subjects,
  });
  Student.print({
    required this.name,
    required this.age,
    required this.subjects,
  }) {
    print(name);
    print(age);
    subjects.forEach((element) {
      print('${element.name} : ${element.marks}');
    });
  }
}
