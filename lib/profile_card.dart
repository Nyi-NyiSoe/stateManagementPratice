import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      required this.name,
      required this.url,
      required this.age,
      required this.student,
      required this.grades,
      required this.city,
      required this.zipCode});
  final String name;
  final String url;
  final String age;
  final bool student;
  final List<int> grades;
  final String city;
  final String zipCode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Image(
                image: NetworkImage(
                    url),fit: BoxFit.cover,),
            Expanded(
              child: ListTile(
                leading: Text('Name:'),
                title: Text(
                  name,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Text('Age:'),
                title: Text(
                  age,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Text('Student:'),
                title: Text(
                  student.toString(),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Text('City:'),
                title: Text(
                  city,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Text('ZipCode:'),
                title: Text(
                  zipCode,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
