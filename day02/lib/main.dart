import 'student.dart';
import 'subject.dart';

void main() {
  Student s1 = Student(
    name: "Ali",
    age: 22,
    subjects: [
      Subject("Math", 10),
      Subject("Science", 20),
    ],
  );
  print(s1.name);
  print(s1.age);
  s1.subjects.forEach((element) {
    print('${element.name} : ${element.marks}');
  });
  Student.print(
    name: "Ahmed",
    age: 10,
    subjects: [
      Subject("Math", 10),
      Subject("Science", 20),
    ],
  );
}
