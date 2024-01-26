import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:riverpod/riverpod.dart';
import 'package:statemanagement/person.dart';

final jsonProvider = FutureProvider<List<Person>>((ref) async {
  final String response = await rootBundle.loadString('assets/test.json');

  final List<dynamic> jsonData = json.decode(response);

  List<Person> people = jsonData.map((json) => Person.fromJson(json)).toList();

  return people;
});
