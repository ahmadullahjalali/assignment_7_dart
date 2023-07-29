import 'dart:io';

void main() {
  List<Student> students = [];

  while (true) {
    print('1. Add student');
    print('2. View all students');
    print('3. Search for student');
    print('4. Exit');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter name:');
        String? name = stdin.readLineSync();
        print('Enter ID:');
        int id = int.parse(stdin.readLineSync() as String);
        List<double> grades = [];
        while (true) {
          print('Enter grade (or "done" to finish):');
          String? input = stdin.readLineSync();
          if (input!.toLowerCase() == 'done') {
            break;
          } else {
            double grade = double.parse(input);
            grades.add(grade);
          }
        }
        Student student = Student(name!, id, grades);
        students.add(student);
        print('Student added successfully!\n');
        break;

      case '2':
        if (students.isEmpty) {
          print('No students found!\n');
        } else {
          for (Student student in students) {
            print(student);
          }
        }
        break;

      case '3':
        if (students.isEmpty) {
          print('No students found!\n');
        } else {
          print('Enter name to search:');
          String? name = stdin.readLineSync();
          List<Student> matchingStudents = students
              .where((s) => s.name.toLowerCase().contains(name!.toLowerCase()))
              .toList();
          if (matchingStudents.isEmpty) {
            print('No matching students found!\n');
          } else {
            for (Student student in matchingStudents) {
              print(student);
            }
          }
        }
        break;

      case '4':
        print('Exiting program...');
        return;

      default:
        print('Invalid choice!\n');
    }
  }
}

class Student {
  String name;
  int id;
  List<double> grades;

  Student(this.name, this.id, this.grades);

  double get averageGrade {
    if (grades.isEmpty) {
      return 0.0;
    } else {
      double sum = grades.reduce((a, b) => a + b);
      return sum / grades.length;
    }
  }

  @override
  String toString() {
    return 'Name: $name\nID: $id\nGrades: $grades\nAverage Grade: ${averageGrade.toStringAsFixed(2)}\n';
  }
}
