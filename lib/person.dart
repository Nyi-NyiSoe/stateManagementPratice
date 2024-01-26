class Person {
  final String name;
  final String url;
  final int age;
  final bool student;
  final List<int> grades;
  final Map<String,dynamic> address;

  Person(
      {required this.name,
      required this.url,
      required this.age,
      required this.student,
      required this.grades,
      required this.address
      });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        name: json['name'],
        url: json['url'],
        age: json['age'] as int,
        grades: (json['grades'] as List<dynamic>?)?.cast<int>() ?? [],
        student: json['student'],
        address: json['address']
        );


  }
}
