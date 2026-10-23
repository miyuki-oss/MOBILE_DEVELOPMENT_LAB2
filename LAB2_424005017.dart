import 'dart:io';

class Student {
  String fullName;
  String idNumber;
  List<double> grades;

  Student({
    required this.fullName,
    required this.idNumber,
    required this.grades,
  });

  void displayProfile() {
    print('\n====================================');
    print('          STUDENT PROFILE           ');
    print('====================================');
    print('Name: $fullName');
    print('ID Number: $idNumber');
  }
}

String computeGrade(List<double> grades) {
  double sum = 0;
  for (double grade in grades) {
    sum += grade;
  }
  double average = sum / grades.length;

  String status;
  if (average >= 75) {
    status = 'Passed';
  } else if (average >= 70) {
    status = 'Conditional';
  } else {
    status = 'Failed';
  }

  return 'Average: ${average.toStringAsFixed(2)} | Status: $status';
}

void main() {
  print('====================================');
  print('  PHILIPPINE UNIVERSITY GRADE SYSTEM');
  print('====================================');


  stdout.write('Enter Student Full Name: ');
  String fullName = stdin.readLineSync() ?? 'Unknown';

  stdout.write('Enter Student ID Number: ');
  String idNumber = stdin.readLineSync() ?? 'N/A';

  List<double> grades = [];
  for (int i = 1; i <= 3; i++) {
    stdout.write('Enter grade for Subject $i: ');
    double grade = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
    grades.add(grade);
  }

  Student student = Student(
    fullName: fullName,
    idNumber: idNumber,
    grades: grades,
  );

  student.displayProfile();

  print('\nSubject Grades:');
  for (int i = 0; i < student.grades.length; i++) {
    print('  - Subject ${i + 1}: ${student.grades[i]}');
  }

  print('\n------------------------------------');
  print(computeGrade(student.grades));
  print('------------------------------------\n');
}